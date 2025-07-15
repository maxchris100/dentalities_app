class AffiliateResponseModel {
  List<AffiliateResponseModelData>? data;
  int? total;
  int? limit;
  int? pageTotal;
  int? page;

  AffiliateResponseModel(
      {this.data, this.total, this.limit, this.pageTotal, this.page});

  AffiliateResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AffiliateResponseModelData>[];
      json['data'].forEach((v) {
        data!.add(new AffiliateResponseModelData.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    pageTotal = json['pageTotal'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['pageTotal'] = this.pageTotal;
    data['page'] = this.page;
    return data;
  }
}

class AffiliateResponseModelData {
  String? id;
  String? channel;
  String? account;
  String? code;
  double? gwp;
  Commission? commission;
  AccountAffiliateResponseModelData? accountAffiliateResponseModelData;

  AffiliateResponseModelData(
      {this.id,
      this.channel,
      this.account,
      this.code,
      this.gwp,
      this.commission,
      this.accountAffiliateResponseModelData});

  AffiliateResponseModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channel = json['channel'];
    account = json['account'];
    code = json['code'];
    gwp = json['gwp'];
    commission = json['commission'] != null
        ? new Commission.fromJson(json['commission'])
        : null;
    accountAffiliateResponseModelData = json['account_data'] != null
        ? new AccountAffiliateResponseModelData.fromJson(json['account_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel'] = this.channel;
    data['account'] = this.account;
    data['code'] = this.code;
    data['gwp'] = this.gwp;
    if (this.commission != null) {
      data['commission'] = this.commission!.toJson();
    }
    if (this.accountAffiliateResponseModelData != null) {
      data['account_data'] = this.accountAffiliateResponseModelData!.toJson();
    }
    return data;
  }
}

class Commission {
  int? potential;
  int? earned;

  Commission({this.potential, this.earned});

  Commission.fromJson(Map<String, dynamic> json) {
    potential = json['potential'];
    earned = json['earned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['potential'] = this.potential;
    data['earned'] = this.earned;
    return data;
  }
}

class AccountAffiliateResponseModelData {
  String? name;
  String? email;
  String? phoneNumber;

  AccountAffiliateResponseModelData({this.name, this.email, this.phoneNumber});

  AccountAffiliateResponseModelData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
