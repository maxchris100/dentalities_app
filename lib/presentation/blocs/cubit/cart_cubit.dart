import 'dart:developer';

import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/delivery_method_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/domain/repositories/cart_repository.dart';
import 'package:dentalities/domain/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class CartData {
  final CartResponse? cart;
  final Product? product;
  final List<Product> relatedProduct;
  final List<DeliveryMethod> deliveryMethod;
  final TransactionResponse? transaction;
  final Transaction? transactionDetail;
  CartData(
      {this.cart,
      this.product,
      this.transaction,
      this.transactionDetail,
      this.relatedProduct = const [],
      this.deliveryMethod = const []});

  CartData copyWith(
      {CartResponse? cart,
      Product? product,
      List<Product>? relatedProduct,
      List<DeliveryMethod>? deliveryMethod,
      TransactionResponse? transaction,
      Transaction? transactionDetail}) {
    return CartData(
        cart: cart ?? this.cart,
        product: product ?? this.product,
        relatedProduct: relatedProduct ?? this.relatedProduct,
        deliveryMethod: deliveryMethod ?? this.deliveryMethod,
        transaction: transaction ?? this.transaction,
        transactionDetail: transactionDetail ?? this.transactionDetail);
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

  Future<void> getDeliveryMethod(int? userAddressId) async {
    try {
      final res =
          await CartRepository.getDeliveryMethod(userAddressId: userAddressId);
      List<DeliveryMethod> datas =
          DeliveryMethod.fromList(res.data["data"]["price"]);

      data = data.copyWith(deliveryMethod: datas);
      emit(CartLoaded(data));
    } catch (e) {
      emit(CartError('Failed to load delivery method: $e'));
    }
  }

  Future<dynamic> checkoutCart(int? userAddressId, String? serviceCode) async {
    try {
      final res = await CartRepository.checkOutOrder(
          userAddressId: userAddressId, serviceCode: serviceCode);
      return res.data;
    } catch (e) {
      return null;
    }
  }

  Future<void> getOrderList({int? page = 1}) async {
    try {
      final datas = await CartRepository.getOrderList(page: page);
      TransactionResponse p = TransactionResponse.fromJson(datas.data["data"]);
      data = data.copyWith(transaction: p);
      emit(CartLoaded(data));
    } catch (e) {
      emit(CartError('Failed to load order: $e'));
    }
  }

  Future<void> getOrderDetail(String? id) async {
    try {
      final datas = await CartRepository.getOrderDetail(uid: id);
      Transaction p = Transaction.fromJson(datas.data["data"]);
      data = data.copyWith(transactionDetail: p);
      emit(CartLoaded(data));
    } catch (e) {
      emit(CartError('Failed to load order detail: $e'));
    }
  }
}
