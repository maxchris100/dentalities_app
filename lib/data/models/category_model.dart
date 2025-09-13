import 'package:dentalities/data/models/product_model.dart';

class Category {
  final int? id;
  final int? parentCategoryId;
  final String? name;
  final String? slug;
  final bool? isPublish;
  final bool? isFeature;
  final String? featureImage;
  final String? featureImageThumb;
  final String? featureImageUrl;
  final String? featureImageThumbUrl;
  final int? sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Product> products;

  Category({
    required this.id,
    this.parentCategoryId,
    required this.name,
    required this.slug,
    required this.isPublish,
    required this.isFeature,
    required this.featureImage,
    required this.featureImageThumb,
    required this.featureImageUrl,
    required this.featureImageThumbUrl,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  static List<Category> fromList(List<dynamic> list) {
    return list.map((item) => Category.fromJson(item)).toList();
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    print("@category");
    return Category(
      id: json['id'] != null ? json['id'] : null,
      parentCategoryId: json['parent_category_id'] != null
          ? json['parent_category_id']
          : null,
      name: json['name'] != null ? json['name'] : null,
      slug: json['slug'] != null ? json['slug'] : null,
      isPublish: json['is_publish'] != null ? json['is_publish'] : null,
      isFeature: json['is_feature'] != null ? json['is_feature'] : null,
      featureImage:
          json['feature_image'] != null ? json['feature_image'] : null,
      featureImageThumb: json['feature_image_thumb'] != null
          ? json['feature_image_thumb']
          : null,
      featureImageUrl:
          json['feature_image_url'] != null ? json['feature_image_url'] : null,
      featureImageThumbUrl: json['feature_image_thumb_url'] != null
          ? json['feature_image_thumb_url']
          : null,
      sortOrder: json['sort_order'] != null ? json['sort_order'] : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      products: json['products'] != null
          ? (json['products'] as List<dynamic>)
              .map((item) => Product.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_category_id': parentCategoryId,
      'name': name,
      'slug': slug,
      'is_publish': isPublish,
      'is_feature': isFeature,
      'feature_image': featureImage,
      'feature_image_thumb': featureImageThumb,
      'feature_image_url': featureImageUrl,
      'feature_image_thumb_url': featureImageThumbUrl,
      'sort_order': sortOrder,
      // 'createdAt': createdAt.toIso8601String(),
      // 'updatedAt': updatedAt.toIso8601String(),
      'products': products,
    };
  }
}
