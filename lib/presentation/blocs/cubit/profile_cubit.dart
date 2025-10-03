import 'package:bloc/bloc.dart';
import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/data/models/user_address_model.dart';
import 'package:dentalities/data/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:dentalities/domain/repositories/profile_repository.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel? profileData;

  ProfileLoaded(this.profileData);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchProfileData() async {
    try {
      emit(ProfileLoading());

      try {
        final datas = await ProfileRepository.getProfile();
        UserModel data = UserModel.fromMap(datas.data["data"]);
        // Constant.userLocalDataSource.saveUser(data);
        final addressResponse = await ProfileRepository.getUserAddress();

// parse default address
        UserAddress defaultAddress = UserAddress.fromJson(
          addressResponse.data["data"]["default_user_address"],
        );

// parse user addresses list
        List<UserAddress> userAddresses = UserAddress.fromList(
          addressResponse.data["data"]["user_addresses"],
        );

// filter duplikat (buang yang sama id dengan default)
        List<UserAddress> filteredAddresses = userAddresses
            .where((addr) => addr.id != defaultAddress.id)
            .toList();

// gabung: defaultAddress di index 0
        List<UserAddress> mergedAddresses = [
          defaultAddress,
          ...filteredAddresses
        ];

// simpan ke local / state
        data.userAddresses = mergedAddresses;
        Constant.userLocalDataSource.setDefaultAddress(defaultAddress);
        Constant.userLocalDataSource.saveUser(data);

        // final defaultAddress = await ProfileRepository.getDefaultAddress();
        // UserAddress userAddress =
        //     UserAddress.fromJson(defaultAddress.data["data"]);
        // Constant.userLocalDataSource.setDefaultAddress(userAddress);

        emit(ProfileLoaded(data));
      } catch (e) {
        emit(ProfileError('Failed to load profile: $e'));
      }

      // if (response.statusCode == 200) {
      //   var res = ProfileResponseModel.fromJson(response.data);
      //   emit(ProfileLoaded(res));
      // } else if (response.statusCode == 403) {
      //   //FORBIDDEN SESSION EXPIRED
      //   emit(ProfileError("Failed to load profile"));
      //   Fluttertoast.showToast(msg: "Session Expired");
      //   authCubit.logout();
      // } else {
      //   emit(ProfileError("Failed to load profile"));
      // }
    } catch (e) {
      print(e.toString());
      emit(ProfileError("Failed to load profile: $e"));
    }
  }

  Future<dynamic> updateProfileData(
      {required String email,
      required String name,
      required String phoneCode,
      required String phoneNumber}) async {
    try {
      final res = await ProfileRepository.updateProfile(
          email: email,
          fullName: name,
          phoneCode: '62',
          phoneNumber: phoneNumber);
      return res.data;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> updatePassword(
      {required String oldPass, required String newPass}) async {
    try {
      final res = await ProfileRepository.changePassword(
          currentPassword: oldPass,
          newPassword: newPass,
          newPasswordConfirm: newPass);
      return res.data;
    } catch (e) {
      return null;
    }
  }
}
