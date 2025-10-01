import 'dart:developer';

import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';
import 'package:dentalities/domain/repositories/product_repository.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/cart_repository.dart';

class ProductData {
  final bool productDetailWishlist;
  final Product? product;
  final List<Product> listProduct;
  final List<Product> relatedProduct;

  ProductData({
    this.product,
    this.listProduct = const [],
    this.relatedProduct = const [],
    this.productDetailWishlist = false, // ✅ default false
  });

  ProductData copyWith({
    bool? productDetailWishlist,
    Product? product,
    List<Product>? listProduct,
    List<Product>? relatedProduct,
  }) {
    return ProductData(
      productDetailWishlist:
          productDetailWishlist ?? this.productDetailWishlist,
      product: product ?? this.product,
      listProduct: listProduct ?? this.listProduct,
      relatedProduct: relatedProduct ?? this.relatedProduct,
    );
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

  Future<String> addToCartVariant(
      BuildContext context, int? productVariantId, int quantity) async {
    log("@PRODUCT: ADD TO CART PRODUCT VARIANT: ${productVariantId} $quantity");
    try {
      final res = await CartRepository.addUpdateCart(
          productVariantId: productVariantId, quantity: quantity);
      CartCubit cartCubit = context.read<CartCubit>();
      await cartCubit.fetchCart();
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

      // var res = await checkWishlistStatus(p.id);
      data = data.copyWith(
          product: p,
          relatedProduct: relatedProducts,
          productDetailWishlist: true);
      emit(ProductLoaded(data));
      return p;
    } catch (e) {
      emit(ProductError('Failed to load product: $e'));
      return null;
    }
  }

  void setProduct(List<Product> datas) {
    data = data.copyWith(product: null, listProduct: datas, relatedProduct: []);
    emit(ProductLoaded(data));
  }

  Future<List<Product>> getSearchProduct(String? keyword,
      {String? brands,
      String? categories,
      String? countries,
      String? specialization_slug,
      int? newArrival,
      int? readyStock,
      int? onPromo,
      String? sort,
      int page = 1,
      int limit = 20,
      bool loadMore = false}) async {
    try {
      final datas = await ProductRepository.searchProducts(
          page: page,
          limit: limit,
          keyword: keyword,
          brands: brands,
          categories: categories,
          specialization_slug: specialization_slug,
          countries: countries,
          newArrival: newArrival,
          readyStock: readyStock,
          onPromo: onPromo,
          sort: sort);
      // List<Product> p = Product.fromList(datas.data["data"]["data"]);
      List<Product> p = Product.fromList(datas.data["data"]["products"]);
      if (loadMore) {
        data = data.copyWith(
            product: null,
            listProduct: [...data.listProduct, ...p],
            relatedProduct: []);
      } else {
        data = data.copyWith(product: null, listProduct: p, relatedProduct: []);
      }
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
      emit(ProductLoaded(data));
      return p;
    } catch (e) {
      emit(ProductError('Failed to load list product: $e'));
      return [];
    }
  }
}
