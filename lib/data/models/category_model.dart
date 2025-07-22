import 'package:dentalities/data/models/product_model.dart';

class Category {
  final int id;
  final int? parentCategoryId;
  final String name;
  final String slug;
  final bool isPublish;
  final bool isFeature;
  final String featureImage;
  final String featureImageThumb;
  final String featureImageUrl;
  final String featureImageThumbUrl;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
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
    return Category(
      id: json['id'],
      parentCategoryId: json['parent_category_id'],
      name: json['name'],
      slug: json['slug'],
      isPublish: json['is_publish'],
      isFeature: json['is_feature'],
      featureImage: json['feature_image'],
      featureImageThumb: json['feature_image_thumb'],
      featureImageUrl: json['feature_image_url'],
      featureImageThumbUrl: json['feature_image_thumb_url'],
      sortOrder: json['sort_order'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      products: (json['products'] as List<dynamic>?)
              ?.map((item) => Product.fromJson(item))
              .toList() ??
          [],
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
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'products': products,
    };
  }
}
