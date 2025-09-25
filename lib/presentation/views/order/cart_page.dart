import 'dart:async';
import 'dart:developer';

import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<int, bool> selected = {};
  Map<int, CartItem> selectedCartItem = {};
  Map<int, int> quantity = {};
  bool selectAll = true;
  bool isGrid = true;
  Map<int, Timer> debounceTimers = {};

  CartCubit cartCubit = CartCubit();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      await cartCubit.fetchCart();

      // Inisialisasi selected dan quantity jika belum ada
      final items = cartCubit.data.cart?.cartItems ?? [];
      for (var item in items) {
        log("@PRODUCT: ${item.productVariantId}, ${item.quantity}");
        if (item.productVariantId != null) {
          selected.putIfAbsent(item.productVariantId!, () => true);
          quantity.putIfAbsent(
              item.productVariantId!, () => item.quantity ?? 1);
        }
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    for (var timer in debounceTimers.values) {
      timer.cancel();
    }
    debounceTimers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cartCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: const BackButton(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildViewToggle(),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: BlocBuilder<CartCubit, CartState>(
                  bloc: cartCubit,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${selected.values.where((e) => e).length} products selected"),
                        // TextButton(
                        //   onPressed: _clearAll,
                        //   child: const Text(
                        //     "Clear",
                        //     style: TextStyle(
                        //         color: Colors.blue,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // )
                      ],
                    );
                  }),
            ),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                bloc: cartCubit,
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CartLoaded) {
                    final items = state.data.cart?.cartItems ?? [];

                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final id = item.productVariantId;
                        if (id == null) return const SizedBox.shrink();

                        return CartItemWidget(
                          isSelected: selected[id] ?? false,
                          imageUrl:
                              item.productVariant?.product?.featureImageUrl ??
                                  "",
                          name: item.productVariant?.product?.displayName ?? "",
                          slug: item.productVariant?.product?.slug ?? "",
                          variant: [
                            item.productVariant?.variantOneName,
                            item.productVariant?.variantTwoName,
                            item.productVariant?.variantThreeName,
                          ].where((e) => e?.isNotEmpty ?? false).join(', '),
                          price: StringUtil.formatMoney(item.price),
                          priceAfterDiscount:
                              (item.price_after_discount ?? 0) > 0
                                  ? StringUtil.formatMoney(
                                      item.price_after_discount ?? 0)
                                  : null,
                          quantity: quantity[id]!,
                          onAdd: () => _changeQty(id, 1),
                          onRemove: () => _changeQty(id, -1),
                          onDelete: () => _removeCart(id, 0),
                          onChecked: (val) => _toggleItem(id, val),
                          isGrid: isGrid,
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
                bloc: cartCubit,
                builder: (context, state) {
                  return _buildBottomBar();
                }),
          ],
        ),
      ),
    );
  }

  void _toggleItem(int id, bool? val) {
    setState(() {
      selected[id] = val ?? false;
      selectAll = selected.values.every((e) => e);
    });
  }

  void _changeQty(int id, int delta) {
    setState(() {
      quantity[id] = (quantity[id]! + delta).clamp(1, 99);
    });
    // Cancel timer kalau sebelumnya ada
    debounceTimers[id]?.cancel();

    // Start debounce baru
    debounceTimers[id] = Timer(const Duration(milliseconds: 500), () {
      cartCubit.addToCartVariant(id, quantity[id]!);
    });
  }

  void _removeCart(int id, int delta) {
    quantity[id] = 0;
    // Cancel timer kalau sebelumnya ada
    debounceTimers[id]?.cancel();

    // Start debounce baru
    debounceTimers[id] = Timer(const Duration(milliseconds: 500), () {
      cartCubit.addToCartVariant(id, 0).then((res) {
        selected.remove(id);
        quantity.remove(id);
      });
    });
  }

  void _clearAll() {
    setState(() {
      for (var key in selected.keys) {
        selected[key] = false;
      }
      selectAll = false;
    });
  }

  Widget _buildBottomBar() {
    int total = 0;
    selected.forEach((id, isSelected) {
      if (isSelected) {
        final qty = quantity[id] ?? 1;
        final price = ((cartCubit.state as CartLoaded)
                .data
                .cart
                ?.cartItems
                ?.firstWhere((e) => e.productVariantId == id)
                .price ??
            0);
        total += (cartCubit.state is CartLoaded) ? price * qty : 0;
      }
    });

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.blue,
            value: selectAll,
            onChanged: null,
            // onChanged: (val) {
            //   setState(() {
            //     selectAll = val ?? false;
            //     for (var key in selected.keys) {
            //       selected[key] = selectAll;
            //     }
            //   });
            // },
          ),
          const Text("All"),
          const Spacer(),
          Text(
            StringUtil.formatMoney(total),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: total > 0
                ? () {
                    final listCart = cartCubit.data.cart?.cartItems ?? [];
                    selectedCartItem = {
                      for (var item in listCart)
                        if (selected[item.productVariantId] == true)
                          item.productVariantId!: item
                    };
                    Navigator.pushNamed(context, AppRouter.orderCheckout,
                        arguments: {
                          "total": StringUtil.castToString(total),
                          "grand_total": StringUtil.castToString(total),
                          "discount": StringUtil.castToString(0),
                          "selected": selected,
                          "selected_cart": selectedCartItem,
                          "quantity": quantity,
                          "total_item": quantity.values
                              .fold(0, (sum, value) => sum + value)
                        });
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Payment',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _buildViewToggle() {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circle yang bergerak
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment: isGrid ? Alignment.centerLeft : Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(2), // biar tidak nempel ke edge
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Icon Grid dan List
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIcon(
                icon: "assets/icons/view_grid.svg",
                selected: isGrid,
                onTap: () => setState(() => isGrid = true),
              ),
              buildIcon(
                icon: "assets/icons/view_list.svg",
                selected: !isGrid,
                onTap: () => setState(() => isGrid = false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIcon({
    required String icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 20,
            width: 20,
            color: selected ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}
