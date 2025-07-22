class ProductMedia {
  final int id;
  final String imageUrl;
  final String image;
  final int sortOrder;
  final int productId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductMedia({
    required this.id,
    required this.imageUrl,
    required this.image,
    required this.sortOrder,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductMedia.fromJson(Map<String, dynamic> json) {
    return ProductMedia(
      id: json['id'],
      imageUrl: json['image_url'] ?? '',
      image: json['image'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
      productId: json['product_id'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  static List<ProductMedia> fromList(List<dynamic> jsonList) {
    return jsonList.map((e) => ProductMedia.fromJson(e)).toList();
  }
}
