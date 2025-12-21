import 'package:dentalities/data/models/product_bundle.dart';
import 'package:dentalities/data/models/product_variant_model.dart';

class CartItem {
  int? id;
  String? sku;
  bool is_discounted;
  int? price;
  int? price_after_discount;
  int? total;
  int? weight;
  int? discount;
  int? quantity;
  int? subtotal;
  String? productName;
  String? productSlug;
  String? productImage;
  String? productImagePath;
  int? productVariantId;
  String? variantOneId;
  String? variantTwoId;
  String? variantThreeId;
  String? variantOneName;
  String? variantTwoName;
  String? variantThreeName;
  ProductVariant? productVariant;
  ProductBundle? productBundle;
  bool isBundle = false;

  CartItem({
    this.id,
    this.sku,
    this.price,
    this.price_after_discount,
    this.total,
    this.weight,
    this.discount,
    this.quantity,
    this.subtotal,
    this.productName,
    this.productSlug,
    this.productImage,
    this.productImagePath,
    this.productVariantId,
    this.variantOneId,
    this.variantTwoId,
    this.variantThreeId,
    this.variantOneName,
    this.variantTwoName,
    this.variantThreeName,
    this.productVariant,
    this.is_discounted = false,
    this.isBundle = false,
    this.productBundle,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    print("@Cartitem");
    return CartItem(
      id: json['id'],
      sku: json['sku'],
      is_discounted:
          json['is_discounted'] != null ? json['is_discounted'] : false,
      price: json['price'] != null ? double.parse(json['price']).toInt() : null,
      price_after_discount: json['price_after_discount'] != null
          ? double.parse(json['price_after_discount']).toInt()
          : null,
      total: json['total'] != null ? double.parse(json['total']).toInt() : null,
      weight: json['weight'],
      discount: json['discount'] != null
          ? double.parse(json['discount']).toInt()
          : null,
      quantity: json['quantity'],
      subtotal: json['subtotal'] != null
          ? double.parse(json['subtotal']).toInt()
          : null,
      productName: json['product_name'],
      productSlug: json['product_slug'],
      productImage: json['product_image'],
      productImagePath: json['product_image_path'],
      productVariantId: json['product_variant_id'],
      variantOneId: json['variant_one_id'],
      variantTwoId: json['variant_two_id'],
      variantThreeId: json['variant_three_id'],
      variantOneName: json['variant_one_name'],
      variantTwoName: json['variant_two_name'],
      variantThreeName: json['variant_three_name'],
      productVariant: json['product_variant'] != null
          ? ProductVariant.fromJson(json['product_variant'])
          : null,
      isBundle: json['is_bundle'] ?? false,
      productBundle: json['product_bundle'] != null
          ? ProductBundle.fromJson(json['product_bundle'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'price': price,
      'total': total,
      'weight': weight,
      'discount': discount,
      'quantity': quantity,
      'subtotal': subtotal,
      'product_name': productName,
      'product_slug': productSlug,
      'product_image': productImage,
      'product_image_path': productImagePath,
      'product_variant_id': productVariantId,
      'variant_one_id': variantOneId,
      'variant_two_id': variantTwoId,
      'variant_three_id': variantThreeId,
      'variant_one_name': variantOneName,
      'variant_two_name': variantTwoName,
      'variant_three_name': variantThreeName,
    };
  }
}

class CartResponse {
  int? id;
  String? totalCost;
  String? discount;
  String? totalAfterDiscount;
  String? tax;
  String? grandTotal;
  int? totalWeight;
  int? userId;
  String? guestSessionId;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<CartItem>? cartItems;

  CartResponse({
    this.id,
    this.totalCost,
    this.discount,
    this.totalAfterDiscount,
    this.tax,
    this.grandTotal,
    this.totalWeight,
    this.userId,
    this.guestSessionId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.cartItems,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    print("@cart");
    return CartResponse(
      id: json['id'],
      totalCost: json['total_cost'],
      discount: json['discount'],
      totalAfterDiscount: json['total_after_discount'],
      tax: json['tax'],
      grandTotal: json['grand_total'],
      totalWeight: json['total_weight'],
      userId: json['user_id'],
      guestSessionId: json['guest_session_id'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      cartItems: (json['cart_items'] as List?)
          ?.map((item) => CartItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_cost': totalCost,
      'discount': discount,
      'total_after_discount': totalAfterDiscount,
      'tax': tax,
      'grand_total': grandTotal,
      'total_weight': totalWeight,
      'user_id': userId,
      'guest_session_id': guestSessionId,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'cart_items': cartItems?.map((item) => item.toJson()).toList(),
    };
  }
}
