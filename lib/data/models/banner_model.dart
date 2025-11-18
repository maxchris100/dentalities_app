import 'package:dentalities/data/models/product_model.dart';

class Banner {
  final int id;
  final String imageUrl;
  final String image;
  final bool isPublish;
  final int? sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? linkType;
  final String? linkValue;
  final List<Product?> products;

  Banner(
      {required this.id,
      required this.imageUrl,
      required this.image,
      required this.isPublish,
      this.sortOrder,
      this.createdAt,
      this.updatedAt,
      this.linkType,
      this.linkValue,
      this.products = const []});

  static List<Banner> fromList(List<dynamic> list) {
    return list.map((item) => Banner.fromJson(item)).toList();
  }

  factory Banner.fromJson(Map<String, dynamic> json) {
    // print("@banner");
    return Banner(
      id: json['id'],
      imageUrl: json["image_url"] != null ? json['image_url'] : "",
      image: json['image'],
      isPublish: json['is_publish'] == 1 ? true : false,
      sortOrder: json['sort_order'],
      linkType: json['link_type'],
      linkValue: json['link_value'],
      products:
          json['products'] != null ? Product.fromList(json['products']) : [],
      // createdAt: DateTime.parse(json['createdAt'] ?? json['created_at']),
      // updatedAt: DateTime.parse(json['updatedAt'] ?? json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'image': image,
      'is_publish': isPublish,
      'sort_order': sortOrder,
      // 'createdAt': createdAt.toIso8601String(),
      // 'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
