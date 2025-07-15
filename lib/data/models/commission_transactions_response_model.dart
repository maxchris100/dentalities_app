class CommisionTransactionsResponseModel {
  List<CommisionTransactionsResponseModelData>? data;
  int? total;
  int? limit;
  int? pageTotal;
  int? page;

  CommisionTransactionsResponseModel(
      {this.data, this.total, this.limit, this.pageTotal, this.page});

  CommisionTransactionsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CommisionTransactionsResponseModelData>[];
      json['data'].forEach((v) {
        data!.add(new CommisionTransactionsResponseModelData.fromJson(v));
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

class CommisionTransactionsResponseModelData {
  String? createdAt;
  Transaction? transaction;
  Commissions? commissions;

  CommisionTransactionsResponseModelData(
      {this.createdAt, this.transaction, this.commissions});

  CommisionTransactionsResponseModelData.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
    commissions = json['commissions'] != null
        ? new Commissions.fromJson(json['commissions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    if (this.commissions != null) {
      data['commissions'] = this.commissions!.toJson();
    }
    return data;
  }
}

class Transaction {
  String? id;
  String? code;
  String? date;
  String? status;
  String? channel;
  String? category;
  Insurance? insurance;

  Transaction(
      {this.id,
      this.code,
      this.date,
      this.status,
      this.channel,
      this.category,
      this.insurance});

  Transaction.fromJson(Map<String, dynamic> json) {
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

class Commissions {
  int? total;
  List<Data>? data;

  Commissions({this.total, this.data});

  Commissions.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Affiliate? affiliate;
  Affiliate? source;
  Commission? commission;
  int? commissionValue;

  Data({this.affiliate, this.source, this.commission, this.commissionValue});

  Data.fromJson(Map<String, dynamic> json) {
    affiliate = json['affiliate'] != null
        ? new Affiliate.fromJson(json['affiliate'])
        : null;
    source =
        json['source'] != null ? new Affiliate.fromJson(json['source']) : null;
    commission = json['commission'] != null
        ? new Commission.fromJson(json['commission'])
        : null;
    commissionValue = json['commission_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.affiliate != null) {
      data['affiliate'] = this.affiliate!.toJson();
    }
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.commission != null) {
      data['commission'] = this.commission!.toJson();
    }
    data['commission_value'] = this.commissionValue;
    return data;
  }
}

class Affiliate {
  String? code;
  String? name;
  String? email;
  String? phoneNumber;

  Affiliate({this.code, this.name, this.email, this.phoneNumber});

  Affiliate.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
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
