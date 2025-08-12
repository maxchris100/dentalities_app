import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/widgets/order_item.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> with TickerProviderStateMixin {
  String selectedFilter = 'unpaid'; // default filter

  late CartCubit cartCubit;
  List<Transaction> filteredOrders = [];
  int page = 1;
  bool isLoadingMore = false;
  bool hasMore = true;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartCubit = context.read<CartCubit>();
      getData();
      FocusScope.of(context).unfocus();

      scrollController.addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 100 &&
            !isLoadingMore &&
            hasMore) {
          loadMore();
        }
      });
    });
  }

  Future<void> getData({bool reset = false}) async {
    try {
      if (reset) {
        page = 1;
        hasMore = true;
        filteredOrders.clear();
      }

      await cartCubit.getOrderList(page: page);

      final newOrders = cartCubit.data.transaction?.transactions ?? [];
      // filteredOrders = (cartCubit.data.transaction?.transactions ?? [])
      //     .where((order) => order.status == selectedFilter)
      //     .toList();
      if (newOrders.isEmpty) {
        hasMore = false;
      } else {
        filteredOrders.addAll(newOrders);
      }

      setState(() {});
    } catch (ex) {
      // handle error
    }
  }

  Future<void> loadMore() async {
    if (!hasMore) return;
    setState(() => isLoadingMore = true);

    page++;
    await getData();
    setState(() => isLoadingMore = false);
  }

  @override
  Widget build(BuildContext context) {
    // AuthCubit authCubit = context.watch<AuthCubit>();
    FocusScope.of(context).unfocus();
    return Scaffold(
      body: Column(
        children: [
          // const SizedBox(height: 16),
          // _buildFilterButtons(),
          const SizedBox(height: 12),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                getData(reset: true);
              },
              child: filteredOrders.isEmpty
                  ? ListView(
                      children: const [
                        SizedBox(
                          height: 400,
                          child: Center(child: Text('No orders found')),
                        ),
                      ],
                    )
                  : ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredOrders.length + 1,
                      itemBuilder: (context, index) {
                        if (index < filteredOrders.length) {
                          final order = filteredOrders[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouter.orderDetail,
                                    arguments: {"item": order});
                              },
                              child: OrderItem(item: order));
                        } else {
                          return hasMore
                              ? const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                )
                              : const SizedBox.shrink();
                        }
                      },
                    ),
            ),
          ),
        ],
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
