import 'package:dentalities/core/util/dio_client.dart';
import 'package:dentalities/domain/repositories/general_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class DeliveryAddressState extends Equatable {
  final bool isLoading;
  final bool isSubmit;
  final List<dynamic> provinces;
  final List<dynamic> cities;
  final List<dynamic> districts;
  final List<dynamic> subdistricts;
  final Map? selectedProvinceId;
  final Map? selectedCityId;
  final Map? selectedDistrictId;
  final Map? selectedSubdistrictId;
  final String? error;
  final bool success;

  const DeliveryAddressState({
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

  DeliveryAddressState copyWith({
    bool? isLoading,
    bool? isSubmit,
    List<dynamic>? provinces,
    List<dynamic>? cities,
    List<dynamic>? districts,
    List<dynamic>? subdistricts,
    Map? selectedProvinceId, // ✅ ubah jadi Map
    Map? selectedCityId, // ✅ ubah jadi Map
    Map? selectedDistrictId, // ✅ ubah jadi Map
    Map? selectedSubdistrictId, // ✅ ubah jadi Map
    String? error,
    bool success = false,
  }) {
    return DeliveryAddressState(
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

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
  DeliveryAddressCubit() : super(const DeliveryAddressState());

  Future<void> loadProvinces() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res = await GeneralRepository.getProvinces();
      emit(state.copyWith(provinces: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectProvince(Map provinceId) async {
    print(provinceId);
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

  Future<void> loadCities(Map provinceId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res =
          await GeneralRepository.getCities(provinceId["id"].toString());
      emit(state.copyWith(cities: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectCity(Map cityId) async {
    emit(state.copyWith(
      selectedCityId: cityId,
      selectedDistrictId: null,
      selectedSubdistrictId: null,
      districts: [],
      subdistricts: [],
    ));
    await loadDistricts(cityId);
  }

  Future<void> loadDistricts(Map cityId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res = await GeneralRepository.getDistricts(cityId["id"].toString());
      emit(state.copyWith(districts: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectDistrict(Map districtId) async {
    emit(state.copyWith(
      selectedDistrictId: districtId,
      selectedSubdistrictId: null,
      subdistricts: [],
    ));
    await loadSubdistricts(districtId);
  }

  Future<void> loadSubdistricts(Map districtId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final res =
          await GeneralRepository.getSubdistricts(districtId["id"].toString());
      emit(state.copyWith(subdistricts: res.data['data'], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void selectSubdistrict(Map subdistrictId) {
    emit(state.copyWith(selectedSubdistrictId: subdistrictId));
  }
}
