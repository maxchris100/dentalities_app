class Brand {
  final int? id;
  final String? name;
  final String? slug;
  final bool? isPublish;
  final int? sortOrder;
  final int? countryId;
  final String? featureImageUrl;
  final String? featureImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Brand({
    this.id,
    this.name,
    this.slug,
    this.isPublish,
    this.sortOrder,
    this.countryId,
    this.featureImageUrl,
    this.featureImage,
    this.createdAt,
    this.updatedAt,
  });

  static List<Brand> fromList(List<dynamic> list) {
    return list.map((item) => Brand.fromJson(item)).toList();
  }

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      isPublish: json['is_publish'],
      sortOrder: json['sort_order'],
      countryId: json['country_id'],
      featureImageUrl: json['feature_image_url'],
      featureImage: json['feature_image'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'is_publish': isPublish,
      'sort_order': sortOrder,
      'country_id': countryId,
      'feature_image_url': featureImageUrl,
      'feature_image': featureImage,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
