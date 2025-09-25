import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/data/models/product_media_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';

class Product {
  final String? featureImageUrl;
  final bool? isDiscounted;
  final int? id;
  final String? name;
  final String? displayName;
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
  final double? productPrice;
  final double? priceBeforeDiscount;
  final double? discountPercentage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? brandId;
  final String? brandName;

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
    this.displayName,
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
    this.productPrice,
    this.priceBeforeDiscount,
    this.discountPercentage,
    this.createdAt,
    this.updatedAt,
    this.brandId,
    this.brandName,
    this.brand,
    this.categories,
    this.productMedia,
    this.productVariants,
  });

  bool get isWishlisted {
    if (productVariants == null || productVariants!.isEmpty) return false;
    return productVariants!.any((v) => v.isWishlisted == true);
  }

  int? get isWishlistedProductVariantId {
    if (productVariants == null || productVariants!.isEmpty) return null;

    try {
      final variant =
          productVariants!.firstWhere((v) => v.isWishlisted == true);
      return variant.id;
    } catch (e) {
      return null; // kalau ga ada yang wishlist, return null
    }
  }

  static List<Product> fromList(List<dynamic> list) {
    return list.map((item) => Product.fromJson(item)).toList();
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    print("@Product Model");
    return Product(
      featureImageUrl: json['feature_image_url'] ?? '',
      isDiscounted: json['is_discounted'] ?? false,
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
      slug: json['slug'],
      isPublish: json['is_publish'] != null ? json['is_publish'] : false,
      isFeature: json['is_feature'] != null ? json['is_feature'] : false,
      isNew: json['is_new'] != null ? json['is_new'] : false,
      sku: json['sku'],
      description: json['description'] ?? '',
      variantOne: json['variant_one'],
      variantTwo: json['variant_two'],
      featureImage: json['feature_image'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      productPrice: json['product_price'] != null
          ? double.tryParse(json['product_price'].toString()) ?? 0.0
          : null,
      priceBeforeDiscount:
          double.tryParse(json['price_before_discount'].toString()) ?? 0.0,
      discountPercentage:
          double.tryParse(json['discount_percentage'].toString()) ?? 0.0,
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
      brandId: json['brand_id'],
      brandName: json['brand_name'],
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
