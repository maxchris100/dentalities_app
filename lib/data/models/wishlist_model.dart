import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';

class Wishlist {
  final int? id;
  final int? productId;
  final int? productVariantId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final Product? product;
  final ProductVariant? productVariant;

  final double? finalPrice;
  final double? finalPriceBeforeDiscount;
  final bool? isDiscounted;
  final double? discountAmount;
  final double? discountPercentage;
  final int? stock;
  final bool? inStock;

  Wishlist({
    this.id,
    this.productId,
    this.productVariantId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.productVariant,
    this.finalPrice,
    this.finalPriceBeforeDiscount,
    this.isDiscounted,
    this.discountAmount,
    this.discountPercentage,
    this.stock,
    this.inStock,
  });

  static List<Wishlist> fromList(List<Map<String, dynamic>> list) {
    return list.map((item) => Wishlist.fromJson(item)).toList();
  }

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      productVariantId: json['product_variant_id'] as int?,
      userId: json['user_id'] as int?,
      // createdAt: json['created_at'] != null
      //     ? DateTime.tryParse(json['created_at'])
      //     : null,
      // updatedAt: json['updated_at'] != null
      //     ? DateTime.tryParse(json['updated_at'])
      //     : null,
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
      productVariant: json['product_variant'] != null
          ? ProductVariant.fromJson(json['product_variant'])
          : null,
      finalPrice: (json['final_price'] != null)
          ? double.tryParse(json['final_price'].toString())
          : null,
      finalPriceBeforeDiscount: (json['final_price_before_discount'] != null)
          ? double.tryParse(json['final_price_before_discount'].toString())
          : null,
      isDiscounted: json['is_discounted'] as bool?,
      discountAmount: (json['discount_amount'] != null)
          ? double.tryParse(json['discount_amount'].toString())
          : null,
      discountPercentage: (json['discount_percentage'] != null)
          ? double.tryParse(json['discount_percentage'].toString())
          : null,
      stock: json['stock'] as int?,
      inStock: json['in_stock'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_variant_id': productVariantId,
      'user_id': userId,
      // 'created_at': createdAt?.toIso8601String(),
      // 'updated_at': updatedAt?.toIso8601String(),
      'product': product?.toJson(),
      'product_variant': productVariant?.toJson(),
      'final_price': finalPrice,
      'final_price_before_discount': finalPriceBeforeDiscount,
      'is_discounted': isDiscounted,
      'discount_amount': discountAmount,
      'discount_percentage': discountPercentage,
      'stock': stock,
      'in_stock': inStock,
    };
  }
}
