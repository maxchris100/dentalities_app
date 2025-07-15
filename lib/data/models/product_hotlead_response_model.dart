class ProductHotleadResponseModel {
  String? message;
  List<ProductHotleadResponseModelData>? data;
  Meta? meta;
  ProductHotleadStatisticResponseModel? statistic;

  ProductHotleadResponseModel(
      {this.message, this.data, this.meta, this.statistic});

  ProductHotleadResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductHotleadResponseModelData>[];
      json['data'].forEach((v) {
        data!.add(new ProductHotleadResponseModelData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    statistic = json['statistic'] != null
        ? new ProductHotleadStatisticResponseModel.fromJson(json['statistic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.statistic != null) {
      data['statistic'] = this.statistic!.toJson();
    }
    return data;
  }
}

class ProductHotleadResponseModelData {
  String? id;
  Products? products;
  Affiliates? affiliates;
  List<String>? step;
  List<AffiliatesCommissions>? affiliatesCommissions;
  String? name;
  String? email;
  double? premi;
  String? currency;
  String? certificateNumber;
  String? scheme;

  ProductHotleadResponseModelData(
      {this.id,
      this.products,
      this.affiliates,
      this.step,
      this.affiliatesCommissions,
      this.name,
      this.email,
      this.premi,
      this.currency,
      this.certificateNumber,
      this.scheme});

  ProductHotleadResponseModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    affiliates = json['affiliates'] != null
        ? new Affiliates.fromJson(json['affiliates'])
        : null;
    step = json['step'].cast<String>();
    if (json['affiliates_commissions'] != null) {
      affiliatesCommissions = <AffiliatesCommissions>[];
      json['affiliates_commissions'].forEach((v) {
        affiliatesCommissions!.add(new AffiliatesCommissions.fromJson(v));
      });
    }
    name = json['name'];
    email = json['email'];
    premi = json['premi'];
    currency = json['currency'];
    certificateNumber = json['certificate_number'];
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.affiliates != null) {
      data['affiliates'] = this.affiliates!.toJson();
    }
    data['step'] = this.step;
    if (this.affiliatesCommissions != null) {
      data['affiliates_commissions'] =
          this.affiliatesCommissions!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['email'] = this.email;
    data['premi'] = this.premi;
    data['currency'] = this.currency;
    data['certificate_number'] = this.certificateNumber;
    data['scheme'] = this.scheme;
    return data;
  }
}

class Products {
  String? name;

  Products({this.name});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Affiliates {
  String? account;

  Affiliates({this.account});

  Affiliates.fromJson(Map<String, dynamic> json) {
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    return data;
  }
}

class AffiliatesCommissions {
  TransactionProductHotleadResponseModelData?
      transactionProductHotleadResponseModelData;
  Commission? commission;
  String? commissionValue;
  String? currency;
  String? premium;

  AffiliatesCommissions(
      {this.transactionProductHotleadResponseModelData,
      this.commission,
      this.commissionValue,
      this.currency,
      this.premium});

  AffiliatesCommissions.fromJson(Map<String, dynamic> json) {
    transactionProductHotleadResponseModelData =
        json['transaction_data'] != null
            ? new TransactionProductHotleadResponseModelData.fromJson(
                json['transaction_data'])
            : null;
    commission = json['commission'] != null
        ? new Commission.fromJson(json['commission'])
        : null;
    commissionValue = json['commission_value'];
    currency = json['currency'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactionProductHotleadResponseModelData != null) {
      data['transaction_data'] =
          this.transactionProductHotleadResponseModelData!.toJson();
    }
    if (this.commission != null) {
      data['commission'] = this.commission!.toJson();
    }
    data['commission_value'] = this.commissionValue;
    data['currency'] = this.currency;
    data['premium'] = this.premium;
    return data;
  }
}

class TransactionProductHotleadResponseModelData {
  String? id;
  String? code;
  String? date;
  String? status;
  String? channel;
  String? category;
  Insurance? insurance;

  TransactionProductHotleadResponseModelData(
      {this.id,
      this.code,
      this.date,
      this.status,
      this.channel,
      this.category,
      this.insurance});

  TransactionProductHotleadResponseModelData.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    date = json['date'];
    status = json['status'];
    channel = json['channel'];
    category = json['category'];
    insurance = json['insurance'] != null
        ? new Insurance.fromJson(json['insurance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['date'] = this.date;
    data['status'] = this.status;
    data['channel'] = this.channel;
    data['category'] = this.category;
    if (this.insurance != null) {
      data['insurance'] = this.insurance!.toJson();
    }
    return data;
  }
}

class Insurance {
  String? id;
  String? name;
  Plan? plan;
  String? premium;
  Plan? product;
  String? currency;

  Insurance(
      {this.id,
      this.name,
      this.plan,
      this.premium,
      this.product,
      this.currency});

  Insurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    premium = json['premium'];
    product =
        json['product'] != null ? new Plan.fromJson(json['product']) : null;
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    data['premium'] = this.premium;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['currency'] = this.currency;
    return data;
  }
}

class Plan {
  String? id;
  String? name;

  Plan({this.id, this.name});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Commission {
  String? type;
  int? value;

  Commission({this.type, this.value});

  Commission.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Meta {
  int? total;
  int? page;
  int? pageSize;
  int? pageTotal;

  Meta({this.total, this.page, this.pageSize, this.pageTotal});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pageSize = json['pageSize'];
    pageTotal = json['pageTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['pageTotal'] = this.pageTotal;
    return data;
  }
}

class ProductHotleadStatisticResponseModel {
  int? all;
  int? personalInfo;
  int? declaration;
  int? payment;
  int? uploadNRIC;

  ProductHotleadStatisticResponseModel(
      {this.all,
      this.personalInfo,
      this.declaration,
      this.payment,
      this.uploadNRIC});

  ProductHotleadStatisticResponseModel.fromJson(Map<String, dynamic> json) {
    all = json['All'];
    personalInfo = json['Personal Info'];
    declaration = json['Declaration'];
    payment = json['Payment'];
    uploadNRIC = json['Upload NRIC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['All'] = this.all;
    data['Personal Info'] = this.personalInfo;
    data['Declaration'] = this.declaration;
    data['Payment'] = this.payment;
    data['Upload NRIC'] = this.uploadNRIC;
    return data;
  }
}
