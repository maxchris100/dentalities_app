import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/data/models/product_media_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';

class Product {
  final String? featureImageUrl;
  final bool? isDiscounted;
  final int? id;
  final String? name;
  final String? slug;
  final bool? isPublish;
  final bool? isFeature;
  final bool? isNew;
  final String? sku;
  final String? description;
  final String? variantOne;
  final String? variantTwo;
  final String? featureImage;
  final double? price;
  final double? priceBeforeDiscount;
  final double? discountPercentage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? brandId;

  // ✅ Tambahan
  final Brand? brand;
  final List<Category>? categories;
  final List<ProductMedia>? productMedia;
  final List<ProductVariant>? productVariants;

  Product({
    this.featureImageUrl,
    this.isDiscounted,
    this.id,
    this.name,
    this.slug,
    this.isPublish,
    this.isFeature,
    this.isNew,
    this.sku,
    this.description,
    this.variantOne,
    this.variantTwo,
    this.featureImage,
    this.price,
    this.priceBeforeDiscount,
    this.discountPercentage,
    this.createdAt,
    this.updatedAt,
    this.brandId,
    this.brand,
    this.categories,
    this.productMedia,
    this.productVariants,
  });

  static List<Product> fromList(List<dynamic> list) {
    return list.map((item) => Product.fromJson(item)).toList();
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      featureImageUrl: json['feature_image_url'] ?? '',
      isDiscounted: json['is_discounted'] ?? false,
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      isPublish: json['is_publish'] ?? false,
      isFeature: json['is_feature'] ?? false,
      isNew: json['is_new'] ?? false,
      sku: json['sku'],
      description: json['description'] ?? '',
      variantOne: json['variant_one'],
      variantTwo: json['variant_two'],
      featureImage: json['feature_image'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      priceBeforeDiscount:
          double.tryParse(json['price_before_discount'].toString()) ?? 0.0,
      discountPercentage:
          double.tryParse(json['discount_percentage'].toString()) ?? 0.0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      brandId: json['brand_id'],
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
      productMedia: (json['product_media'] as List<dynamic>?)
              ?.map((e) => ProductMedia.fromJson(e))
              .toList() ??
          [],
      productVariants: (json['product_variants'] as List<dynamic>?)
              ?.map((e) => ProductVariant.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // existing fields...
      'brand_id': brandId,
      'brand': brand?.toJson(),
      'categories': categories?.map((e) => e.toJson()).toList(),
      // 'product_media': productMedia?.map((e) => e.toJson()).toList(),
      'product_variants': productVariants?.map((e) => e.toJson()).toList(),
    };
  }
}
