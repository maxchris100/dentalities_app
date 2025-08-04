import 'package:dentalities/data/models/product_variant_model.dart';
import 'package:dentalities/data/models/user_address_model.dart';

class TransactionResponse {
  List<Transaction>? transactions;
  int? lastPage;

  TransactionResponse({
    this.transactions,
    this.lastPage,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      transactions: (json['transactions'] as List?)
          ?.map((e) => Transaction.fromJson(e))
          .toList(),
      lastPage: json['last_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactions': transactions?.map((e) => e.toJson()).toList(),
      'last_page': lastPage,
    };
  }
}

class Transaction {
  PaymentResponse? paymentResponse;
  int? id;
  String? status;
  String? expiredAt;
  String? createdAt;
  String? updatedAt;
  String? uuid;
  String? invoiceNumber;
  String? productCost;
  String? shippingCost;
  String? totalCost;
  String? totalAfterDiscount;
  String? tax;
  String? grandTotal;
  int? weight;
  String? shippingCourierCode;
  String? shippingCourierName;
  String? shippingServiceCode;
  String? shippingServiceName;
  String? cnoteNo;
  String? invoicePdf;
  String? shippingLabelPdf;
  int? userId;
  UserAddress? shippingAddress;
  List<TransactionItem>? transactionItems;

  Transaction({
    this.paymentResponse,
    this.id,
    this.status,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.invoiceNumber,
    this.productCost,
    this.shippingCost,
    this.totalCost,
    this.totalAfterDiscount,
    this.tax,
    this.grandTotal,
    this.weight,
    this.shippingCourierCode,
    this.shippingCourierName,
    this.shippingServiceCode,
    this.shippingServiceName,
    this.cnoteNo,
    this.invoicePdf,
    this.shippingLabelPdf,
    this.userId,
    this.shippingAddress,
    this.transactionItems,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      paymentResponse: json['payment_response'] != null
          ? PaymentResponse.fromJson(json['payment_response'])
          : null,
      id: json['id'],
      status: json['status'],
      expiredAt: json['expired_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      uuid: json['uuid'],
      invoiceNumber: json['invoice_number'],
      productCost: json['product_cost'],
      shippingCost: json['shipping_cost'],
      totalCost: json['total_cost'],
      totalAfterDiscount: json['total_after_discount'],
      tax: json['tax'],
      grandTotal: json['grand_total'],
      weight: json['weight'],
      shippingCourierCode: json['shipping_courier_code'],
      shippingCourierName: json['shipping_courier_name'],
      shippingServiceCode: json['shipping_service_code'],
      shippingServiceName: json['shipping_service_name'],
      cnoteNo: json['cnote_no'],
      invoicePdf: json['invoice_pdf'],
      shippingLabelPdf: json['shipping_label_pdf'],
      userId: json['user_id'],
      shippingAddress: json['shipping_address'] != null
          ? UserAddress.fromJson(json['shipping_address'])
          : null,
      transactionItems: (json['transaction_items'] as List?)
          ?.map((e) => TransactionItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_response': paymentResponse?.toJson(),
      'id': id,
      'status': status,
      'expired_at': expiredAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'uuid': uuid,
      'invoice_number': invoiceNumber,
      'product_cost': productCost,
      'shipping_cost': shippingCost,
      'total_cost': totalCost,
      'total_after_discount': totalAfterDiscount,
      'tax': tax,
      'grand_total': grandTotal,
      'weight': weight,
      'shipping_courier_code': shippingCourierCode,
      'shipping_courier_name': shippingCourierName,
      'shipping_service_code': shippingServiceCode,
      'shipping_service_name': shippingServiceName,
      'cnote_no': cnoteNo,
      'invoice_pdf': invoicePdf,
      'shipping_label_pdf': shippingLabelPdf,
      'user_id': userId,
      'shipping_address': shippingAddress?.toJson(),
      'transaction_items': transactionItems?.map((e) => e.toJson()).toList(),
    };
  }
}

class PaymentResponse {
  String? merchantID;
  String? transactionNo;
  String? insertStatus;
  String? insertMessage;
  String? transactionEngine;
  String? redirectURL;

  PaymentResponse({
    this.merchantID,
    this.transactionNo,
    this.insertStatus,
    this.insertMessage,
    this.transactionEngine,
    this.redirectURL,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      merchantID: json['merchantID'],
      transactionNo: json['transactionNo'],
      insertStatus: json['insertStatus'],
      insertMessage: json['insertMessage'],
      transactionEngine: json['transactionEngine'],
      redirectURL: json['redirectURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'merchantID': merchantID,
      'transactionNo': transactionNo,
      'insertStatus': insertStatus,
      'insertMessage': insertMessage,
      'transactionEngine': transactionEngine,
      'redirectURL': redirectURL,
    };
  }
}

class TransactionItem {
  bool? isDiscounted;
  int? id;
  int? productVariantId;
  String? price;
  String? discount;
  String? priceAfterDiscount;
  int? quantity;
  String? subtotal;
  String? total;
  int? transactionId;
  String? productName;
  String? productSlug;
  String? productFeatureImage;
  String? variantOneId;
  String? variantOneName;
  String? variantTwoId;
  String? variantTwoName;
  int? weight;
  ProductVariant? productVariant;

  TransactionItem({
    this.isDiscounted,
    this.id,
    this.productVariantId,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.quantity,
    this.subtotal,
    this.total,
    this.transactionId,
    this.productName,
    this.productSlug,
    this.productFeatureImage,
    this.variantOneId,
    this.variantOneName,
    this.variantTwoId,
    this.variantTwoName,
    this.weight,
    this.productVariant,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) {
    return TransactionItem(
      isDiscounted: json['is_discounted'],
      id: json['id'],
      productVariantId: json['product_variant_id'],
      price: json['price'],
      discount: json['discount'],
      priceAfterDiscount: json['price_after_discount'],
      quantity: json['quantity'],
      subtotal: json['subtotal'],
      total: json['total'],
      transactionId: json['transaction_id'],
      productName: json['product_name'],
      productSlug: json['product_slug'],
      productFeatureImage: json['product_feature_image'],
      variantOneId: json['variant_one_id'],
      variantOneName: json['variant_one_name'],
      variantTwoId: json['variant_two_id'],
      variantTwoName: json['variant_two_name'],
      weight: json['weight'],
      productVariant: json['product_variant'] != null
          ? ProductVariant.fromJson(json['product_variant'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_discounted': isDiscounted,
      'id': id,
      'product_variant_id': productVariantId,
      'price': price,
      'discount': discount,
      'price_after_discount': priceAfterDiscount,
      'quantity': quantity,
      'subtotal': subtotal,
      'total': total,
      'transaction_id': transactionId,
      'product_name': productName,
      'product_slug': productSlug,
      'product_feature_image': productFeatureImage,
      'variant_one_id': variantOneId,
      'variant_one_name': variantOneName,
      'variant_two_id': variantTwoId,
      'variant_two_name': variantTwoName,
      'weight': weight,
      'product_variant': productVariant?.toJson(),
    };
  }
}
