class Country {
  final int id;
  final String name;
  final String slug;
  final int sortOrder;
  String? featureImageUrl;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.slug,
    required this.sortOrder,
    this.featureImageUrl,
    // required this.createdAt,
    // required this.updatedAt,
  });

  static List<Country> fromList(List<dynamic> list) {
    return list.map((item) => Country.fromJson(item)).toList();
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    print("@");
    return Country(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      sortOrder: json['sort_order'],
      featureImageUrl: json['banner_image_url'],
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'sort_order': sortOrder,
      'feature_image_url': featureImageUrl,
      // 'createdAt': createdAt.toIso8601String(),
      // 'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
