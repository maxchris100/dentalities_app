class ProductResponseModel {
  final String title;
  final String brand;
  final String image;
  final String price;
  final String? oldPrice;
  final String? badge;

  ProductResponseModel({
    required this.title,
    required this.brand,
    required this.image,
    required this.price,
    this.oldPrice,
    this.badge,
  });
}
