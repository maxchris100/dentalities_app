import 'package:dentalities/data/models/product_model.dart';

class ProductVariant {
  final int id;
  final String sku;
  final double price;
  final double priceBeforeDiscount;
  final double discountPercentage;
  final int quantity;
  final int weight;
  final String? variantOneId;
  final String? variantOneName;
  final String? variantTwoId;
  final String? variantTwoName;
  final String? variantThreeId;
  final String? variantThreeName;
  final bool isDiscounted;
  final int productId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Product? product;

  ProductVariant({
    required this.id,
    required this.sku,
    required this.price,
    required this.priceBeforeDiscount,
    required this.discountPercentage,
    required this.quantity,
    required this.weight,
    required this.variantOneId,
    required this.variantOneName,
    required this.variantTwoId,
    required this.variantTwoName,
    required this.variantThreeId,
    required this.variantThreeName,
    required this.isDiscounted,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    this.product,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json['id'],
      sku: json['sku'] ?? '',
      price: double.tryParse(json['price'] ?? '0') ?? 0,
      priceBeforeDiscount:
          double.tryParse(json['price_before_discount'] ?? '0') ?? 0,
      discountPercentage:
          double.tryParse(json['discount_percentage'] ?? '0') ?? 0,
      quantity: json['quantity'],
      weight: json['weight'],
      variantOneId: json['variant_one_id'],
      variantOneName: json['variant_one_name'],
      variantTwoId: json['variant_two_id'],
      variantTwoName: json['variant_two_name'],
      variantThreeId: json['variant_three_id'],
      variantThreeName: json['variant_three_name'],
      isDiscounted: json['is_discounted'],
      productId: json['product_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'sku': sku,
        'price': price.toStringAsFixed(2),
        'price_before_discount': priceBeforeDiscount.toStringAsFixed(2),
        'discount_percentage': discountPercentage.toStringAsFixed(2),
        'quantity': quantity,
        'weight': weight,
        'variant_one_id': variantOneId,
        'variant_one_name': variantOneName,
        'variant_two_id': variantTwoId,
        'variant_two_name': variantTwoName,
        'variant_three_id': variantThreeId,
        'variant_three_name': variantThreeName,
        'is_discounted': isDiscounted,
        'product_id': productId,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        // 'product': product?.toJson(),
      };

  ProductVariant copyWith({
    int? id,
    String? sku,
    double? price,
    double? priceBeforeDiscount,
    double? discountPercentage,
    int? quantity,
    int? weight,
    String? variantOneId,
    String? variantOneName,
    String? variantTwoId,
    String? variantTwoName,
    String? variantThreeId,
    String? variantThreeName,
    bool? isDiscounted,
    int? productId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Product? product,
  }) {
    return ProductVariant(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      priceBeforeDiscount: priceBeforeDiscount ?? this.priceBeforeDiscount,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      quantity: quantity ?? this.quantity,
      weight: weight ?? this.weight,
      variantOneId: variantOneId ?? this.variantOneId,
      variantOneName: variantOneName ?? this.variantOneName,
      variantTwoId: variantTwoId ?? this.variantTwoId,
      variantTwoName: variantTwoName ?? this.variantTwoName,
      variantThreeId: variantThreeId ?? this.variantThreeId,
      variantThreeName: variantThreeName ?? this.variantThreeName,
      isDiscounted: isDiscounted ?? this.isDiscounted,
      productId: productId ?? this.productId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      product: product ?? this.product,
    );
  }
}
