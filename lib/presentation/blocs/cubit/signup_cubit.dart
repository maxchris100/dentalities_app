import 'package:dentalities/domain/repositories/auth_repository.dart';
import 'package:dentalities/domain/repositories/general_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final int currentStep;
  final bool isLoading;
  final bool isSubmit;
  final List<dynamic> provinces;
  final List<dynamic> cities;
  final List<dynamic> districts;
  final List<dynamic> subdistricts;
  final String? selectedProvinceId;
  final String? selectedCityId;
  final String? selectedDistrictId;
  final String? selectedSubdistrictId;
  final String? error;
  final bool success;

  const SignUpState({
    this.currentStep = 0,
    this.isLoading = false,
    this.isSubmit = false,
    this.provinces = const [],
    this.cities = const [],
    this.districts = const [],
    this.subdistricts = const [],
    this.selectedProvinceId,
    this.selectedCityId,
    this.selectedDistrictId,
    this.selectedSubdistrictId,
    this.error,
    this.success = false,
  });

  SignUpState copyWith({
    int? currentStep,
    bool? isLoading,
    bool? isSubmit,
    List<dynamic>? provinces,
    List<dynamic>? cities,
    List<dynamic>? districts,
    List<dynamic>? subdistricts,
    String? selectedProvinceId,
    String? selectedCityId,
    String? selectedDistrictId,
    String? selectedSubdistrictId,
    String? error,
    bool success = false,
  }) {
    return SignUpState(
        currentStep: currentStep ?? this.currentStep,
        isLoading: isLoading ?? this.isLoading,
        isSubmit: isSubmit ?? this.isSubmit,
        provinces: provinces ?? this.provinces,
        cities: cities ?? this.cities,
        districts: districts ?? this.districts,
        subdistricts: subdistricts ?? this.subdistricts,
        selectedProvinceId: selectedProvinceId ?? this.selectedProvinceId,
        selectedCityId: selectedCityId ?? this.selectedCityId,
        selectedDistrictId: selectedDistrictId ?? this.selectedDistrictId,
        selectedSubdistrictId:
            selectedSubdistrictId ?? this.selectedSubdistrictId,
        error: error,
        success: success);
  }

  @override
  List<Object?> get props => [
        currentStep,
        isLoading,
        isSubmit,
        provinces,
        cities,
        districts,
        subdistricts,
        selectedProvinceId,
        selectedCityId,
        selectedDistrictId,
        selectedSubdistrictId,
        error,
        success
      ];
}

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void changeStep(int step) {
    emit(state.copyWith(currentStep: step));
  }

  Future<void> register({
    required String salutation,
    required String titlePrefix,
    required String fullName,
    required String titleSuffix,
    required String phoneCode,
    required String phoneNumber,
    required String email,
    required String password,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String subdistrictId,
    required String postalCode,
    required String address,
  }) async {
    emit(state.copyWith(isSubmit: true, error: null));
    try {
      final res = await AuthRepository.register(
        salutation: salutation,
        titlePrefix: titlePrefix,
        fullName: fullName,
        titleSuffix: titleSuffix,
        phoneCode: phoneCode,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        provinceId: provinceId,
        cityId: cityId,
        districtId: districtId,
        subdistrictId: subdistrictId,
        postalCode: postalCode,
        address: address,
      );

      final data = res.data['data'];
      // Optional: handle data / simpan user, dll
      emit(state.copyWith(isSubmit: false, success: true));
    } catch (e) {
      emit(state.copyWith(isSubmit: false, error: e.toString()));
    }
  }

  Future<void> loadProvinces() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res = await GeneralRepository.getProvinces();
      emit(state.copyWith(provinces: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectProvince(String provinceId) async {
    emit(state.copyWith(
      selectedProvinceId: provinceId,
      selectedCityId: null,
      selectedDistrictId: null,
      selectedSubdistrictId: null,
      cities: [],
      districts: [],
      subdistricts: [],
    ));
    await loadCities(provinceId);
  }

  Future<void> loadCities(String provinceId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res = await GeneralRepository.getCities(provinceId);
      emit(state.copyWith(cities: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectCity(String cityId) async {
    emit(state.copyWith(
      selectedCityId: cityId,
      selectedDistrictId: null,
      selectedSubdistrictId: null,
      districts: [],
      subdistricts: [],
    ));
    await loadDistricts(cityId);
  }

  Future<void> loadDistricts(String cityId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res = await GeneralRepository.getDistricts(cityId);
      emit(state.copyWith(districts: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectDistrict(String districtId) async {
    emit(state.copyWith(
      selectedDistrictId: districtId,
      selectedSubdistrictId: null,
      subdistricts: [],
    ));
    await loadSubdistricts(districtId);
  }

  Future<void> loadSubdistricts(String districtId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res = await GeneralRepository.getSubdistricts(districtId);
      emit(state.copyWith(subdistricts: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void selectSubdistrict(String subdistrictId) {
    emit(state.copyWith(selectedSubdistrictId: subdistrictId));
  }
}
