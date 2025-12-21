import 'package:dentalities/data/models/product_bundle.dart';

class FeaturedBundle {
  int? id;
  int? sortOrder;
  int? isPublished;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<FeaturedBundleItem>? featuredBundleItems;

  FeaturedBundle({
    this.id,
    this.sortOrder,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.featuredBundleItems,
  });

  factory FeaturedBundle.fromJson(Map<String, dynamic> json) {
    return FeaturedBundle(
      id: json['id'],
      sortOrder: json['sort_order'],
      isPublished: json['is_published'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deleted_at'],
      featuredBundleItems: (json['featured_bundle_items'] as List?)
          ?.map((e) => FeaturedBundleItem.fromJson(e))
          .toList(),
    );
  }

  static List<FeaturedBundle> fromList(List<dynamic>? list) {
    if (list == null) return [];
    return list
        .map((e) => FeaturedBundle.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class FeaturedBundleItem {
  int? id;
  int? featuredBundleId;
  int? productBundleId;
  int? sortOrder;
  int? isPublished;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  ProductBundle? productBundle;

  FeaturedBundleItem({
    this.id,
    this.featuredBundleId,
    this.productBundleId,
    this.sortOrder,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productBundle,
  });

  factory FeaturedBundleItem.fromJson(Map<String, dynamic> json) {
    return FeaturedBundleItem(
      id: json['id'],
      featuredBundleId: json['featured_bundle_id'],
      productBundleId: json['product_bundle_id'],
      sortOrder: json['sort_order'],
      isPublished: json['is_published'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deleted_at'],
      productBundle: json['product_bundle'] != null
          ? ProductBundle.fromJson(json['product_bundle'])
          : null,
    );
  }
}
