import 'dart:developer';

import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/domain/repositories/cart_repository.dart';
import 'package:dentalities/domain/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class CartData {
  final CartResponse? cart;
  final Product? product;
  final List<Product> relatedProduct;
  CartData({this.cart, this.product, this.relatedProduct = const []});

  CartData copyWith({
    CartResponse? cart,
    Product? product,
    List<Product>? relatedProduct,
  }) {
    return CartData(
        cart: cart ?? this.cart,
        product: product ?? this.product,
        relatedProduct: relatedProduct ?? this.relatedProduct);
  }
}

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartData data;
  CartLoaded(this.data);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartCubit extends Cubit<CartState> {
  CartData data = CartData(cart: null, product: null);
  CartCubit() : super(CartInitial());

  Future<void> fetchCart() async {
    try {
      final cart = await CartRepository.getCart();
      CartResponse list = CartResponse.fromJson(cart.data["data"]);
      data = data.copyWith(cart: list);
      emit(CartLoaded(data));
    } catch (e) {
      emit(CartError('Failed to load carts: $e'));
    }
  }

  Future<void> addToCart(Product? p, int quantity) async {
    log("@CART: ADD TO CART PRODUCT: ${p?.id} $quantity");
    try {
      final res = await CartRepository.addUpdateCart(
          productVariantId: p?.productVariants?.first.id, quantity: quantity);

      emit(CartLoaded(data));
      ToastUtil.showToast("", "Added to cart");
    } catch (e) {
      emit(CartError('Failed to load carts: $e'));
    }
  }

  Future<void> addToCartVariant(int? productVariantId, int quantity) async {
    log("@CART: ADD TO CART PRODUCT VARIANT: $productVariantId $quantity");
    try {
      final res = await CartRepository.addUpdateCart(
          productVariantId: productVariantId, quantity: quantity);

      emit(CartLoaded(data));
      // ToastUtil.showToast("", "Cart updated");
    } catch (e) {
      emit(CartError('Failed to load carts: $e'));
    }
  }

  Future<void> getProductDetail(String slug) async {
    try {
      final product = await ProductRepository.getProductBySlug(slug);
      Product p = Product.fromJson(product.data["data"]["product"]);
      List<Product> relatedProducts =
          Product.fromList(product.data["data"]["related_products"]);
      data = data.copyWith(product: p, relatedProduct: relatedProducts);
      emit(CartLoaded(data));
    } catch (e) {
      emit(CartError('Failed to load product: $e'));
    }
  }

  Future<void> checkoutCart(int? userAddressId) async {
    try {
      final res = await CartRepository.checkOutOrder(
          userAddressId: userAddressId, serviceCode: "REG");
    } catch (e) {}
  }
}
