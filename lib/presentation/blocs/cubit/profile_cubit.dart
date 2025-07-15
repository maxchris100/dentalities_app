import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:foriyana_app/data/models/profile_response_model.dart';
import 'package:foriyana_app/domain/repositories/profile_repository.dart';
import 'package:foriyana_app/presentation/blocs/cubit/auth_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileResponseModel? profileData;

  ProfileLoaded(this.profileData);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchProfileData(AuthCubit authCubit) async {
    try {
      emit(ProfileLoading());
      String channel = UserLocalDataSource.userData?.channel ?? "";
      var response = await ProfileRepository.getProfile(channel);
      if (response.statusCode == 200) {
        var res = ProfileResponseModel.fromJson(response.data);
        emit(ProfileLoaded(res));
      } else if (response.statusCode == 403) {
        //FORBIDDEN SESSION EXPIRED
        emit(ProfileError("Failed to load profile"));
        Fluttertoast.showToast(msg: "Session Expired");
        authCubit.logout();
      } else {
        emit(ProfileError("Failed to load profile"));
      }
    } catch (e) {
      print(e.toString());
      emit(ProfileError("Failed to load profile: $e"));
    }
  }
}
