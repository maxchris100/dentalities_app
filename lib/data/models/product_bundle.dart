import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';

class ProductBundle {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? featureImage;
  String? featureImageUrl;
  String? bundlePrice;
  String? originalTotalPrice;
  String? discountPercentage;
  String? savingsAmount;
  bool? isAvailable;
  bool? isActive;
  bool? isFeatured;
  int? stockQuantity;
  int? lowestStockQuantity;
  String? createdAt;
  String? updatedAt;
  List<BundleItem>? bundleItems;

  ProductBundle({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.featureImage,
    this.featureImageUrl,
    this.bundlePrice,
    this.originalTotalPrice,
    this.discountPercentage,
    this.savingsAmount,
    this.isAvailable,
    this.isActive,
    this.isFeatured,
    this.stockQuantity,
    this.lowestStockQuantity,
    this.createdAt,
    this.updatedAt,
    this.bundleItems,
  });

  factory ProductBundle.fromJson(Map<String, dynamic> json) {
    print(" @ProductBundle ");
    return ProductBundle(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      featureImage: json['feature_image'],
      featureImageUrl: json['feature_image_url'],
      bundlePrice: json['bundle_price'],
      originalTotalPrice: json['original_total_price'],
      discountPercentage: json['discount_percentage'],
      savingsAmount: json['savings_amount'],
      isAvailable: json['is_available'],
      isActive: json['is_active'],
      isFeatured: json['is_featured'],
      stockQuantity: json['stock_quantity'],
      lowestStockQuantity: json['lowest_stock_quantity'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      bundleItems: (json['bundle_items'] as List?)
          ?.map((e) => BundleItem.fromJson(e))
          .toList(),
    );
  }

  static fromList(List<dynamic> jsonList) {
    List<ProductBundle> bundles = [];
    for (var item in jsonList) {
      bundles.add(ProductBundle.fromJson(item));
    }
    return bundles;
  }
}

class BundleItem {
  int? id;
  int? productBundleId;
  int? productId;
  int? productVariantId;
  int? quantity;
  String? bundleItemPrice;
  int? displayOrder;
  String? createdAt;
  String? updatedAt;
  Product? product;
  ProductVariant? productVariant;

  BundleItem({
    this.id,
    this.productBundleId,
    this.productId,
    this.productVariantId,
    this.quantity,
    this.bundleItemPrice,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.productVariant,
  });

  factory BundleItem.fromJson(Map<String, dynamic> json) {
    return BundleItem(
      id: json['id'],
      productBundleId: json['product_bundle_id'],
      productId: json['product_id'],
      productVariantId: json['product_variant_id'],
      quantity: json['quantity'],
      bundleItemPrice: json['bundle_item_price'],
      displayOrder: json['display_order'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
      productVariant: json['product_variant'] != null
          ? ProductVariant.fromJson(json['product_variant'])
          : null,
    );
  }
}
