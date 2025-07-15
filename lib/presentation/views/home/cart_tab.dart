import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foriyana_app/core/router/app_router.dart';
import 'package:foriyana_app/presentation/blocs/cubit/auth_cubit.dart';
import 'package:foriyana_app/presentation/blocs/cubit/profile_cubit.dart';
import 'package:foriyana_app/presentation/widgets/order_item.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> with TickerProviderStateMixin {
  String selectedFilter = 'DELIVERED'; // default filter

  final List<Map<String, dynamic>> _orders = [
    {
      'orderId': '#1514',
      'date': '13/05/2021',
      'trackingNumber': 'IK987362341',
      'quantity': 2,
      'subtotal': 110,
      'status': 'DELIVERED',
    },
    {
      'orderId': '#1679',
      'date': '12/05/2021',
      'trackingNumber': 'IK3873218890',
      'quantity': 3,
      'subtotal': 450,
      'status': 'DELIVERED',
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  ProfileCubit profileCubit = ProfileCubit();
  void getData() async {
    try {} catch (ex) {}
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.watch<AuthCubit>();
    final filteredOrders =
        _orders.where((order) => order['status'] == selectedFilter).toList();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => profileCubit),
      ],
      child: Scaffold(
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
                                    context, AppRouter.orderDetail);
                              },
                              child: OrderItem());
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    final filters = ['Pending', 'DELIVERED', 'Cancelled'];

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
