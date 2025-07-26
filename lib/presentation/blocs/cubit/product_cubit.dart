import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/domain/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class ProductData {
  final Product? product;
  final List<Product> relatedProduct;
  ProductData({this.product, this.relatedProduct = const []});

  ProductData copyWith({
    Product? product,
    List<Product>? relatedProduct,
  }) {
    return ProductData(
        product: product ?? this.product,
        relatedProduct: relatedProduct ?? this.relatedProduct);
  }
}

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductData data;
  ProductLoaded(this.data);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

class ProductCubit extends Cubit<ProductState> {
  ProductData data = ProductData(product: null, relatedProduct: []);
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProduct() async {
    try {
      final product = await ProductRepository.getCategoryProducts(slug: "");
      // ProductResponse list = ProductResponse.fromJson(product.data["data"]);
      // data = data.copyWith(product: list);
      emit(ProductLoaded(data));
    } catch (e) {
      emit(ProductError('Failed to load products: $e'));
    }
  }

  Future<void> addToCart() async {
    try {
      // final categories = await ProductRepository.getProduct();
      // List<Category> list =
      //     Category.fromList(categories.data["data"]["categories"]);
      // data = data.copyWith(product: list);
      // emit(ProductLoaded(data));
      ToastUtil.showToast("", "Added to cart");
    } catch (e) {
      emit(ProductError('Failed to load products: $e'));
    }
  }

  Future<void> getProductByCategorySlug(String categorySlug) async {
    print("categoryslug");
    try {
      final res =
          await ProductRepository.getCategoryProducts(slug: categorySlug);
      List<Product> relatedProducts =
          Product.fromList(res.data["data"]["related_products"]);
      data = data.copyWith(relatedProduct: relatedProducts);
      emit(ProductLoaded(data));
    } catch (e) {
      emit(ProductError('Failed to load product: $e'));
    }
  }

  Future<void> getProductDetail(String slug) async {
    try {
      final product = await ProductRepository.getProductBySlug(slug);
      Product p = Product.fromJson(product.data["data"]["product"]);
      List<Product> relatedProducts =
          Product.fromList(product.data["data"]["related_products"]);
      data = data.copyWith(product: p, relatedProduct: relatedProducts);
      emit(ProductLoaded(data));
    } catch (e) {
      emit(ProductError('Failed to load product: $e'));
    }
  }
}
