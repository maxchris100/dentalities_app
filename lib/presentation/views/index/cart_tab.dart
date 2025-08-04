import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
import 'package:dentalities/presentation/widgets/order_item.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> with TickerProviderStateMixin {
  String selectedFilter = 'unpaid'; // default filter

  // final List<Map<String, dynamic>> _orders = [
  //   {
  //     'orderId': '#1514',
  //     'date': '13/05/2021',
  //     'trackingNumber': 'IK987362341',
  //     'quantity': 2,
  //     'subtotal': 110,
  //     'status': 'DELIVERED',
  //   },
  //   {
  //     'orderId': '#1679',
  //     'date': '12/05/2021',
  //     'trackingNumber': 'IK3873218890',
  //     'quantity': 3,
  //     'subtotal': 450,
  //     'status': 'DELIVERED',
  //   },
  // ];

  late CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartCubit = context.read<CartCubit>();
      getData();
    });
  }

  List<Transaction> filteredOrders = [];
  void getData() async {
    try {
      await cartCubit.getOrderList();
      filteredOrders = (cartCubit.data.transaction?.transactions ?? [])
          .where((order) => order.status == selectedFilter)
          .toList();
      setState(() {});
    } catch (ex) {}
  }

  @override
  Widget build(BuildContext context) {
    // AuthCubit authCubit = context.watch<AuthCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildFilterButtons(),
            const SizedBox(height: 16),
            Expanded(
              child: filteredOrders.isEmpty
                  ? const Center(child: Text('No orders found'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredOrders.length,
                      itemBuilder: (context, index) {
                        final order = filteredOrders[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.orderDetail,
                                  arguments: {"item": order});
                            },
                            child: OrderItem(item: order));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    final filters = ['unpaid', 'paid'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: filters.map((filter) {
        final isSelected = filter == selectedFilter;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: TextButton(
            onPressed: () {
              setState(() {
                selectedFilter = filter;

                filteredOrders =
                    (cartCubit.data.transaction?.transactions ?? [])
                        .where((order) => order.status == selectedFilter)
                        .toList();
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: isSelected ? Colors.black87 : Colors.grey[300],
              foregroundColor: isSelected ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(filter),
          ),
        );
      }).toList(),
    );
  }
}
