import 'package:dentalities/core/util/string_util.dart';

class UserAddress {
  final int id;
  final String provinceName;
  final String cityName;
  final String districtName;
  final String villageName;
  final String address;
  final String villageCode;
  final int? jneProvinceId;
  final int? jneCityId;
  final int? jneDistrictId;
  final int? jneSubdistrictId;
  final String? jneTariffCode;
  final String postcode;
  final int userId;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phoneCode;
  final String? phoneNumber;
  final String? label;
  final String lat;
  final String lng;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? transactionId;

  UserAddress({
    required this.id,
    required this.provinceName,
    required this.cityName,
    required this.districtName,
    required this.villageName,
    required this.address,
    required this.villageCode,
    this.jneProvinceId,
    this.jneCityId,
    this.jneDistrictId,
    this.jneSubdistrictId,
    this.jneTariffCode,
    required this.postcode,
    required this.userId,
    this.firstName,
    this.lastName,
    this.fullName,
    required this.lat,
    required this.lng,
    this.transactionId,
    this.phoneCode,
    this.phoneNumber,
    this.label,
  });

  static List<UserAddress> fromList(List<dynamic> list) {
    return list.map((item) => UserAddress.fromJson(item)).toList();
  }

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    print("@useraddress");
    return UserAddress(
      id: json['id'],
      provinceName: json['province_name'],
      cityName: json['city_name'],
      districtName: json['district_name'],
      villageName: json['village_name'],
      address: json['address'],
      villageCode: StringUtil.castToString(json['village_code']),
      jneProvinceId: json['jne_province_id'],
      jneCityId: json['jne_city_id'],
      jneDistrictId: json['jne_district_id'],
      jneSubdistrictId: json['jne_subdistrict_id'],
      jneTariffCode: json['jne_tariff_code'],
      postcode: json['postcode'],
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      fullName: json['full_name'],
      phoneCode: json['phone_code'],
      phoneNumber: json['phone_number'],
      label: json['label'],
      lat: StringUtil.castToString(json['lat']),
      lng: StringUtil.castToString(json['lng']),
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
      transactionId:
          json["transaction_id"] != null ? json["transaction_id"] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'province_name': provinceName,
      'city_name': cityName,
      'district_name': districtName,
      'village_name': villageName,
      'address': address,
      'village_code': villageCode,
      'jne_province_id': jneProvinceId,
      'jne_city_id': jneCityId,
      'jne_district_id': jneDistrictId,
      'jne_subdistrict_id': jneSubdistrictId,
      'jne_tariff_code': jneTariffCode,
      'postcode': postcode,
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'full_name': fullName,
      'lat': lat,
      'lng': lng,
      // 'createdAt': createdAt.toIso8601String(),
      // 'updatedAt': updatedAt.toIso8601String(),
    };
  }

  String getShippingAddress() {
    try {
      String address = (this.address ?? "") +
          ", " +
          (this.provinceName ?? "") +
          ", " +
          (this.cityName ?? "") +
          ", " +
          (this.districtName ?? "") +
          ", " +
          (this.villageName ?? "") +
          ", " +
          (this.postcode ?? "");
      return address;
    } catch (e) {
      return "";
    }
  }
}
