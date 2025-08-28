import 'dart:developer';

import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';
import 'package:dentalities/domain/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/cart_repository.dart';

class ProductData {
  final Product? product;
  final List<Product> listProduct;
  final List<Product> relatedProduct;
  ProductData(
      {this.product,
      this.listProduct = const [],
      this.relatedProduct = const []});

  ProductData copyWith({
    Product? product,
    List<Product>? listProduct,
    List<Product>? relatedProduct,
  }) {
    return ProductData(
        product: product ?? this.product,
        listProduct: listProduct ?? this.listProduct,
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
  ProductData data =
      ProductData(product: null, listProduct: [], relatedProduct: []);
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

  // Future<String> addToCart(Product? p, int quantity) async {
  //   log("@PRODUCT: ADD TO CART PRODUCT: ${p?.id} $quantity");
  //   try {
  //     final res = await CartRepository.addUpdateCart(
  //         productVariantId: p?.productVariants?.first.id, quantity: quantity);
  //     return "Cart Updated";
  //     // return res.data["message"] ?? "";
  //   } catch (e) {}
  //   return "Error Adding to cart";
  // }

  Future<String> addToCartVariant(int? productVariantId, int quantity) async {
    log("@PRODUCT: ADD TO CART PRODUCT VARIANT: ${productVariantId} $quantity");
    try {
      final res = await CartRepository.addUpdateCart(
          productVariantId: productVariantId, quantity: quantity);
      return "Cart Updated";
      // return res.data["message"] ?? "";
    } catch (e) {}
    return "Error Adding to cart";
  }

  Future<void> getProductByCategorySlug(String categorySlug) async {
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

  Future<Product?> getProductDetail(String slug) async {
    try {
      final product = await ProductRepository.getProductBySlug(slug);
      Product p = Product.fromJson(product.data["data"]["product"]);
      List<Product> relatedProducts =
          Product.fromList(product.data["data"]["related_products"]);
      data = data.copyWith(product: p, relatedProduct: relatedProducts);
      emit(ProductLoaded(data));
      return p;
    } catch (e) {
      emit(ProductError('Failed to load product: $e'));
      return null;
    }
  }

  Future<void> getSearchProduct(String? keyword,
      {String? brands, String? categories}) async {
    try {
      final datas = await ProductRepository.searchProducts(
          keyword: keyword, brands: brands, categories: categories);
      List<Product> p = Product.fromList(datas.data["data"]["data"]);

// 1 =
// "total_items" -> 2
// 2 =
// "last_page" -> 1
// 3 =
// "current_page" -> 1
// 4 =
// "per_page" -> 6
// 5 =
// "categories" -> List (24 items)
// 6 =
// "brands" -> List (2 items)
      data = data.copyWith(product: null, listProduct: p, relatedProduct: []);
      emit(ProductLoaded(data));
    } catch (e) {
      emit(ProductError('Failed to load list product: $e'));
    }
  }
}
