class SubCategory {
  final int id;
  final int parentCategoryId;
  final String name;
  final String slug;
  final bool isPublish;
  final bool isFeature;
  final String? featureImageUrl;
  final String? featureImageThumbUrl;
  final String? featureImage;
  final String? featureImageThumb;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubCategory({
    required this.id,
    required this.parentCategoryId,
    required this.name,
    required this.slug,
    required this.isPublish,
    required this.isFeature,
    this.featureImageUrl,
    this.featureImageThumbUrl,
    this.featureImage,
    this.featureImageThumb,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  static List<SubCategory> fromList(List<dynamic> list) {
    return list.map((item) => SubCategory.fromJson(item)).toList();
  }

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      parentCategoryId: json['parent_category_id'],
      name: json['name'],
      slug: json['slug'],
      isPublish: json['is_publish'],
      isFeature: json['is_feature'],
      featureImageUrl: json['feature_image_url'],
      featureImageThumbUrl: json['feature_image_thumb_url'],
      featureImage: json['feature_image'],
      featureImageThumb: json['feature_image_thumb'],
      sortOrder: json['sort_order'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
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
      'feature_image_url': featureImageUrl,
      'feature_image_thumb_url': featureImageThumbUrl,
      'feature_image': featureImage,
      'feature_image_thumb': featureImageThumb,
      'sort_order': sortOrder,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
