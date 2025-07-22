import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/banner_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/domain/repositories/Cart_repository.dart';
import 'package:dio/src/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../widgets/product_model.dart';

class CartData {
  final List<dynamic> cart;

  CartData({
    required this.cart,
  });

  CartData copyWith({
    List<dynamic>? cart,
  }) {
    return CartData(
      cart: cart ?? this.cart,
    );
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
  CartData data = CartData(
    cart: [],
  );
  CartCubit() : super(CartInitial());

  Future<void> fetchCart() async {
    try {
      // final categories = await CartRepository.getCart();
      // List<Category> list =
      //     Category.fromList(categories.data["data"]["categories"]);
      // data = data.copyWith(cart: list);
      // emit(CartLoaded(data));
    } catch (e) {
      emit(CartError('Failed to load carts: $e'));
    }
  }

  Future<void> addToCart() async {
    try {
      // final categories = await CartRepository.getCart();
      // List<Category> list =
      //     Category.fromList(categories.data["data"]["categories"]);
      // data = data.copyWith(cart: list);
      // emit(CartLoaded(data));
      ToastUtil.showToast("", "Added to cart");
    } catch (e) {
      emit(CartError('Failed to load carts: $e'));
    }
  }
}
