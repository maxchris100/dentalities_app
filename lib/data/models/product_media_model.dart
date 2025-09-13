class ProductMedia {
  final int? id;
  final String? imageUrl;
  final String? image;
  final int? sortOrder;
  final int? productId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductMedia({
    this.id,
    this.imageUrl,
    this.image,
    this.sortOrder,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductMedia.fromJson(Map<String, dynamic> json) {
    return ProductMedia(
      id: json['id'] != null ? json['id'] as int : null,
      imageUrl: json['image_url'] != null ? json['image_url'] as String : null,
      image: json['image'] != null ? json['image'] as String : null,
      sortOrder: json['sort_order'] != null ? json['sort_order'] as int : null,
      productId: json['product_id'] != null ? json['product_id'] as int : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  static List<ProductMedia> fromList(List<dynamic>? jsonList) {
    if (jsonList == null) return [];
    return jsonList.map((e) => ProductMedia.fromJson(e)).toList();
  }
}
