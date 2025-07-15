import 'package:foriyana_app/core/util/string_util.dart';

class ProductResponseModel {
  String? id;
  String? channel;
  String? product;
  ProductData? productData;
  String? name;
  String? url;
  String? createdAt;
  String? updatedAt;
  List<AffiliatesStatistics>? affiliatesStatistics;
  List<ProductCommissions>? productCommissions;
  int? totalPolicy;
  String? totalContribution;
  String? totalCommission;

  ProductResponseModel({
    this.id,
    this.channel,
    this.product,
    this.productData,
    this.name,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.affiliatesStatistics,
    this.productCommissions,
    this.totalPolicy,
    this.totalContribution,
    this.totalCommission,
  });

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      channel = json['channel'];
      product = json['product'];
      productData =
          json['product_data'] != null
              ? new ProductData.fromJson(json['product_data'])
              : null;
      name = json['name'];
      url = json['url'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      if (json['affiliates_statistics'] != null) {
        affiliatesStatistics = <AffiliatesStatistics>[];
        json['affiliates_statistics'].forEach((v) {
          affiliatesStatistics!.add(AffiliatesStatistics.fromJson(v));
        });
      }
      // if (json['product_commissions'] != null) {
      //   productCommissions = <ProductCommissions>[];
      //   json['product_commissions'].forEach((v) {
      //     productCommissions!.add(new ProductCommissions.fromJson(v));
      //   });
      // }
      totalPolicy = json['total_policy'];
      totalContribution = json['total_contribution'];
      totalCommission = json['total_commission'];
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel'] = this.channel;
    data['product'] = this.product;
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    data['name'] = this.name;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.affiliatesStatistics != null) {
      data['affiliates_statistics'] =
          this.affiliatesStatistics!.map((v) => v.toJson()).toList();
    }
    if (this.productCommissions != null) {
      data['product_commissions'] =
          this.productCommissions!.map((v) => v.toJson()).toList();
    }
    data['total_policy'] = this.totalPolicy;
    data['total_contribution'] = this.totalContribution;
    data['total_commission'] = this.totalCommission;
    return data;
  }
}

class ProductData {
  String? name;
  Category? category;
  Insurance? insurance;

  ProductData({this.name, this.category, this.insurance});

  ProductData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category =
        json['category'] != null
            ? new Category.fromJson(json['category'])
            : null;
    insurance =
        json['insurance'] != null
            ? new Insurance.fromJson(json['insurance'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.insurance != null) {
      data['insurance'] = this.insurance!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
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

class AffiliatesStatistics {
  String? id;
  String? affiliate;
  List<dynamic>? step;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? transaction;
  List<AffiliatesCommissions>? affiliatesCommissions;
  String? amountContribution;
  String? amountCommission;

  AffiliatesStatistics({
    this.id,
    this.affiliate,
    this.step,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.transaction,
    this.affiliatesCommissions,
    this.amountContribution,
    this.amountCommission,
  });

  AffiliatesStatistics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    affiliate = StringUtil.castToString(json['affiliate']);
    step = json['step'] ?? [];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    transaction = json['transaction'];
    if (json['affiliates_commissions'] != null) {
      affiliatesCommissions = <AffiliatesCommissions>[];
      json['affiliates_commissions'].forEach((v) {
        affiliatesCommissions!.add(AffiliatesCommissions.fromJson(v));
      });
    }
    amountContribution = StringUtil.castToString(json['amount_contribution']);
    amountCommission = double.tryParse(
      (json['amount_commission'] ?? 0).toString(),
    )?.toStringAsFixed(2);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['affiliate'] = this.affiliate;
    data['step'] = this.step;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['transaction'] = this.transaction;
    if (this.affiliatesCommissions != null) {
      data['affiliates_commissions'] =
          this.affiliatesCommissions!.map((v) => v.toJson()).toList();
    }
    data['amount_contribution'] = this.amountContribution;
    data['amount_commission'] = this.amountCommission;
    return data;
  }
}

class AffiliatesCommissions {
  String? id;
  String? affiliateStatistic;
  String? affiliate;
  String? source;
  String? transaction;
  TransactionData? transactionData;
  Commission? commission;
  String? commissionValue;
  String? currency;
  String? status;

  AffiliatesCommissions({
    this.id,
    this.affiliateStatistic,
    this.affiliate,
    this.source,
    this.transaction,
    this.transactionData,
    this.commission,
    this.commissionValue,
    this.currency,
    this.status,
  });

  AffiliatesCommissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    affiliateStatistic = json['affiliate_statistic'];
    affiliate = StringUtil.castToString(json['affiliate']);
    source = json['source'];
    transaction = StringUtil.castToString(json['transaction']);
    transactionData =
        json['transaction_data'] != null
            ? TransactionData.fromJson(json['transaction_data'])
            : null;
    commission =
        json['commission'] != null
            ? Commission.fromJson(json['commission'])
            : null;
    commissionValue = StringUtil.castToString(json['commission_value']);
    currency = json['currency'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['affiliate_statistic'] = this.affiliateStatistic;
    data['affiliate'] = this.affiliate;
    data['source'] = this.source;
    data['transaction'] = this.transaction;
    if (this.transactionData != null) {
      data['transaction_data'] = this.transactionData!.toJson();
    }
    if (this.commission != null) {
      data['commission'] = this.commission!.toJson();
    }
    data['commission_value'] = this.commissionValue;
    data['currency'] = this.currency;
    data['status'] = this.status;
    return data;
  }
}

class TransactionData {
  String? id;
  String? code;
  String? date;
  String? status;
  String? channel;
  String? category;
  Insurance? insurance;

  TransactionData({
    this.id,
    this.code,
    this.date,
    this.status,
    this.channel,
    this.category,
    this.insurance,
  });

  TransactionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    date = json['date'];
    status = json['status'];
    channel = json['channel'];
    category = json['category'];
    insurance =
        json['insurance'] != null
            ? Insurance.fromJson(json['insurance'])
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
  String? name;
  Category? plan;
  String? premium;
  Category? product;
  String? currency;
  String? id;

  Insurance({
    this.name,
    this.plan,
    this.premium,
    this.product,
    this.currency,
    this.id,
  });

  Insurance.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    plan = json['plan'] != null ? new Category.fromJson(json['plan']) : null;
    premium = json['premium'];
    product =
        json['product'] != null ? new Category.fromJson(json['product']) : null;
    currency = json['currency'];
    id = StringUtil.castToString(json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    data['premium'] = this.premium;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['currency'] = this.currency;
    data['id'] = this.id;
    return data;
  }
}

class Commission {
  String? type;
  String? value;

  Commission({this.type, this.value});

  Commission.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = StringUtil.castToString(json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class ProductCommissions {
  String? id;
  List<Commission>? commission;
  String? createdAt;
  String? updatedAt;

  ProductCommissions({
    this.id,
    this.commission,
    this.createdAt,
    this.updatedAt,
  });

  ProductCommissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['commission'] != null) {
      commission = <Commission>[];
      json['commission'].forEach((v) {
        commission!.add(new Commission.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.commission != null) {
      data['commission'] = this.commission!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
