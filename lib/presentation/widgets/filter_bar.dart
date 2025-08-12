import 'package:dentalities/presentation/widgets/filter_brand.dart';
import 'package:dentalities/presentation/widgets/filter_category.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String? selectedSort;
  bool onPromo = false;
  bool readyStock = false;
  List<String> selectedCategories = [];
  List<String> selectedBrands = [];

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView(
        children: ['Popular', 'Newest', 'Price Low', 'Price High']
            .map((sort) => ListTile(
                  title: Text(sort),
                  onTap: () {
                    setState(() => selectedSort = sort);
                    Navigator.pop(context);
                  },
                ))
            .toList(),
      ),
    );
  }

  void _showReadyStockOptions() {
    setState(() => readyStock = !readyStock);
    // showModalBottomSheet(
    //   context: context,
    //   builder: (_) => ListView(
    //     children: [
    //       SwitchListTile(
    //         title: const Text('Only show promotional items'),
    //         value: onPromo,
    //         onChanged: (val) {
    //           setState(() => onPromo = val);
    //           Navigator.pop(context);
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

  void _showPromoOptions() {
    setState(() => onPromo = !onPromo);
    // showModalBottomSheet(
    //   context: context,
    //   builder: (_) => ListView(
    //     children: [
    //       SwitchListTile(
    //         title: const Text('Only show promotional items'),
    //         value: onPromo,
    //         onChanged: (val) {
    //           setState(() => onPromo = val);
    //           Navigator.pop(context);
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

  void _showCategoryOptions() {
    // final allCategories = ['Electronics', 'Books', 'Fashion', 'Home'];
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FilterCategory();
        }

        // StatefulBuilder(
        //   builder: (context, setModalState) =>

        //   Column(
        //     children: [
        //       Expanded(
        //         child: ListView(
        //           children: allCategories
        //               .map(
        //                 (cat) => CheckboxListTile(
        //                   title: Text(cat),
        //                   value: selectedCategories.contains(cat),
        //                   onChanged: (val) {
        //                     setModalState(() {
        //                       if (val == true) {
        //                         selectedCategories.add(cat);
        //                       } else {
        //                         selectedCategories.remove(cat);
        //                       }
        //                     });
        //                   },
        //                 ),
        //               )
        //               .toList(),
        //         ),
        //       ),
        //       TextButton(
        //         onPressed: () {
        //           setState(() {});
        //           Navigator.pop(context);
        //         },
        //         child: const Text("Apply"),
        //       )
        //     ],
        //   ),
        // ),
        );
  }

  void _showBrandsOptions() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FilterBrand();
        });
  }

  void _clearFilters() {
    setState(() {
      selectedSort = null;
      onPromo = false;
      readyStock = false;
      selectedCategories.clear();
      selectedBrands.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Visibility(
              visible: selectedSort != null && onPromo ||
                  readyStock ||
                  selectedBrands.isNotEmpty ||
                  selectedCategories.isNotEmpty,
              child: OutlinedButton.icon(
                onPressed: _clearFilters,
                icon: const Icon(Icons.clear, color: Colors.red),
                label: const Text('Clear', style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: _showSortOptions,
              icon: Icon(Icons.sort,
                  color: selectedSort != null ? Colors.blue : Colors.grey),
              label: Text('Sort',
                  style: TextStyle(
                      color: selectedSort != null ? Colors.blue : Colors.grey)),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(0, 36),
                backgroundColor: Colors.white,
                side: BorderSide(
                    color: selectedSort != null ? Colors.blue : Colors.grey),
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: _showPromoOptions,
              icon: Icon(Icons.percent,
                  color: onPromo ? Colors.blue : Colors.grey),
              label: Text(
                'On Promo',
                style: TextStyle(color: onPromo ? Colors.blue : Colors.grey),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(0, 36),
                side: BorderSide(color: onPromo ? Colors.blue : Colors.grey),
                foregroundColor: onPromo ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: _showCategoryOptions,
              style: OutlinedButton.styleFrom(
                minimumSize: Size(0, 36),
                side: BorderSide(
                  color:
                      selectedCategories.isNotEmpty ? Colors.blue : Colors.grey,
                ),
                foregroundColor:
                    selectedCategories.isNotEmpty ? Colors.blue : Colors.grey,
              ),
              child: Row(
                children: [
                  Text(
                    'Category${selectedCategories.isNotEmpty ? ' (${selectedCategories.length})' : ''}',
                    style: TextStyle(
                        color: selectedCategories.isNotEmpty
                            ? Colors.blue
                            : Colors.grey),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: selectedCategories.isNotEmpty
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: _showBrandsOptions,
              style: OutlinedButton.styleFrom(
                minimumSize: Size(0, 36),
                side: BorderSide(
                  color: selectedBrands.isNotEmpty ? Colors.blue : Colors.grey,
                ),
                foregroundColor:
                    selectedBrands.isNotEmpty ? Colors.blue : Colors.grey,
              ),
              child: Row(
                children: [
                  Text(
                    'Brand${selectedBrands.isNotEmpty ? ' (${selectedBrands.length})' : ''}',
                    style: TextStyle(
                        color: selectedBrands.isNotEmpty
                            ? Colors.blue
                            : Colors.grey),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color:
                        selectedBrands.isNotEmpty ? Colors.blue : Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: _showReadyStockOptions,
              icon: Icon(Icons.percent,
                  color: readyStock ? Colors.blue : Colors.grey),
              label: Text(
                'Ready Stock',
                style: TextStyle(color: readyStock ? Colors.blue : Colors.grey),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(0, 36),
                side: BorderSide(color: readyStock ? Colors.blue : Colors.grey),
                foregroundColor: readyStock ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
