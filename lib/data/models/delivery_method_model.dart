class DeliveryMethod {
  String? currency;
  String? destinationName;
  String? etdFrom;
  String? etdThru;
  String? goodsType;
  String? originName;
  String? price;
  String? serviceCode;
  String? serviceDisplay;
  String? times;

  DeliveryMethod({
    this.currency,
    this.destinationName,
    this.etdFrom,
    this.etdThru,
    this.goodsType,
    this.originName,
    this.price,
    this.serviceCode,
    this.serviceDisplay,
    this.times,
  });

  factory DeliveryMethod.fromJson(Map<String, dynamic> json) {
    return DeliveryMethod(
      currency: json['currency'] as String?,
      destinationName: json['destination_name'] as String?,
      etdFrom: json['etd_from'] as String?,
      etdThru: json['etd_thru'] as String?,
      goodsType: json['goods_type'] as String?,
      originName: json['origin_name'] as String?,
      price: json['price']?.toString(), // bisa numeric
      serviceCode: json['service_code'] as String?,
      serviceDisplay: json['service_display'] as String?,
      times: json['times'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'destination_name': destinationName,
      'etd_from': etdFrom,
      'etd_thru': etdThru,
      'goods_type': goodsType,
      'origin_name': originName,
      'price': price,
      'service_code': serviceCode,
      'service_display': serviceDisplay,
      'times': times,
    };
  }

  /// Convert List JSON menjadi List<DeliveryMethod>
  static List<DeliveryMethod> fromList(List<dynamic>? list) {
    if (list == null) return [];
    return list
        .map((e) => DeliveryMethod.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
