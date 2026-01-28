import 'dart:async';
import 'dart:developer';

import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/widgets/cart_item.dart';
import 'package:dentalities/presentation/widgets/cart_item_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool selectAll = true;
  bool isGrid = true;
  Map<String, bool> selected = {};
  Map<String, CartItem> selectedCartItem = {};
  Map<String, int> quantity = {};
  Map<String, Timer> debounceTimers = {};

  CartCubit cartCubit = CartCubit();

  String variantKey(int id) => 'p$id';
  String bundleKey(int id) => 'b$id';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      await cartCubit.fetchCart();

      // Inisialisasi selected dan quantity jika belum ada
      final items = cartCubit.data.cart?.cartItems ?? [];
      for (var item in items) {
        if (item.isBundle && item.productBundle?.id != null) {
          final key = bundleKey(item.productBundle!.id!);
          selected.putIfAbsent(key, () => true);
          quantity.putIfAbsent(key, () => item.quantity ?? 1);
        } else if (item.productVariantId != null) {
          final key = variantKey(item.productVariantId!);
          selected.putIfAbsent(key, () => true);
          quantity.putIfAbsent(key, () => item.quantity ?? 1);
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
                        // if (id == null) return const SizedBox.shrink();
                        if (item.isBundle) {
                          final key = bundleKey(item.productBundle!.id!);

                          return CartItemBundleWidget(
                            isSelected: selected[key] ?? false,
                            imageUrl: item.productBundle?.featureImageUrl ?? "",
                            name: item.productBundle?.name ?? "",
                            slug: item.productBundle?.slug ?? "",
                            variant: "",
                            price: StringUtil.formatMoney(
                                item.productBundle?.originalTotalPrice ?? 0),
                            priceAfterDiscount: StringUtil.formatMoney(
                                item.productBundle?.bundlePrice ?? 0),
                            quantity: quantity[key] ?? 0,
                            onAdd: () => _changeQty(key, 1, item.isBundle),
                            onRemove: () => _changeQty(key, -1, item.isBundle),
                            onDelete: () => _removeCart(key, 0, item.isBundle),
                            onChecked: (val) => _toggleItem(key, val),
                            isGrid: isGrid,
                            itemBundle: item.productBundle?.bundleItems ?? [],
                          );
                        }
                        final key = variantKey(item.productVariantId!);

                        return CartItemWidget(
                          isSelected: selected[key] ?? false,
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
                          quantity: quantity[key] ?? 0,
                          onAdd: () => _changeQty(key, 1),
                          onRemove: () => _changeQty(key, -1),
                          onDelete: () => _removeCart(key, 0),
                          onChecked: (val) => _toggleItem(key, val),
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

  void _toggleItem(String key, bool? val) {
    setState(() {
      selected[key] = val ?? false;
      selectAll = selected.values.every((e) => e);
    });
  }

  void _changeQty(String key, int delta, [bool isBundle = false]) {
    setState(() {
      quantity[key] = (quantity[key]! + delta).clamp(1, 99);
    });
    // Cancel timer kalau sebelumnya ada
    debounceTimers[key]?.cancel();

    // Start debounce baru
    debounceTimers[key] = Timer(const Duration(milliseconds: 500), () {
      final id = int.parse(key.substring(1));

      if (isBundle) {
        cartCubit.updateToCartBundle(id, quantity[key]!);
        return;
      }
      cartCubit.addToCartVariant(id, quantity[key]!);
    });
  }

  void _removeCart(String key, int delta, [bool isBundle = false]) {
    quantity[key] = 0;
    // Cancel timer kalau sebelumnya ada
    debounceTimers[key]?.cancel();

    // Start debounce baru
    debounceTimers[key] = Timer(const Duration(milliseconds: 500), () {
      final id = int.parse(key.substring(1));

      if (isBundle) {
        cartCubit.updateToCartBundle(id, 0).then((res) {
          selected.remove(key);
          quantity.remove(key);
        });
        return;
      }
      cartCubit.addToCartVariant(id, 0).then((res) {
        selected.remove(key);
        quantity.remove(key);
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
    int total_discount = 0;
    selected.forEach((key, isSelected) {
      if (isSelected) {
        final qty = quantity[key] ?? 1;
        var price = ((cartCubit.state as CartLoaded)
                .data
                .cart
                ?.cartItems
                ?.firstWhere((e) {
              if (e.isBundle) {
                final id = int.parse(key.substring(1));
                return e.productBundle?.id == id;
              }
              final id = int.parse(key.substring(1));
              return e.productVariantId == id;
            }).price_after_discount ??
            0);
        total += (cartCubit.state is CartLoaded) ? price * qty : 0;

        var discount = ((cartCubit.state as CartLoaded)
                .data
                .cart
                ?.cartItems
                ?.firstWhere((e) {
              if (e.isBundle) {
                final id = int.parse(key.substring(1));
                return e.productBundle?.id == id;
              }
              final id = int.parse(key.substring(1));
              return e.productVariantId == id;
            }).discount ??
            0);
        total_discount += (cartCubit.state is CartLoaded) ? discount * qty : 0;
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
                        if (item.isBundle && item.productBundle?.id != null)
                          if (selected[bundleKey(item.productBundle!.id!)] ==
                              true)
                            bundleKey(item.productBundle!.id!): item
                          else if (item.productVariantId != null)
                            if (selected[variantKey(item.productVariantId!)] ==
                                true)
                              variantKey(item.productVariantId!): item
                    };
                    Navigator.pushNamed(context, AppRouter.orderCheckout,
                        arguments: {
                          "total": StringUtil.castToString(total),
                          "grand_total": StringUtil.castToString(total),
                          "discount": StringUtil.castToString(total_discount),
                          "subtotal":
                              StringUtil.castToString(total + total_discount),
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
