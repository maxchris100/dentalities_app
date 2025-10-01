import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/data/models/country_model.dart';
import 'package:dentalities/presentation/widgets/filter_brand.dart';
import 'package:dentalities/presentation/widgets/filter_category.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  Map<String, Category> initSelectedCategories = {};
  Map<String, Brand> initSelectedBrands = {};
  Map<String, Country> initSelectedCountries = {};

  Function(String?, String?, String?,
      {String? sort, int readyStock, int onPromo}) onFilterChanged;
  FilterBar(
      {Key? key,
      required this.onFilterChanged,
      required this.initSelectedCategories,
      required this.initSelectedBrands,
      required this.initSelectedCountries})
      : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String? selectedSort;
  bool onPromo = false;
  bool readyStock = false;
  Map<String, Category> selectedCategories = {};
  Map<String, Brand> selectedBrands = {};
  Map<String, Country> selectedCountry = {};

  // List<String> selectedCountries = [];
  // List<String> selectedBrands = [];

  // List<String> selectedCategories = [];
  // List<String> selectedCountries = [];
  // List<String> selectedBrands = [];

  @override
  void initState() {
    selectedCategories = widget.initSelectedCategories;
    selectedBrands = widget.initSelectedBrands;
    super.initState();
  }

  void _showSortOptions() {
    String? tempSelectedSort = selectedSort;

    final sortOptions = {
      // 'latest': 'Relevance',
      'most_purchased': 'Most Purchased',
      'max_price': 'Highest Price',
      'min_price': 'Lowest Price',
      // 'a_z': 'A-Z',
      // 'z_a': 'Z-A',
    };

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: const Text(
                    "Sort",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.separated(
                    itemCount: sortOptions.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final entry = sortOptions.entries.elementAt(index);
                      return ListTile(
                        title: Text(entry.value),
                        trailing: Radio<String>(
                          value: entry.key,
                          groupValue: tempSelectedSort,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setModalState(() {
                              tempSelectedSort = value!;
                            });
                          },
                        ),
                        onTap: () {
                          setModalState(() {
                            tempSelectedSort = entry.key;
                          });
                        },
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedSort = tempSelectedSort;
                        });

                        //get product
                        Navigator.pop(context);
                        widget.onFilterChanged(
                          selectedCategories.keys.toList().join(','),
                          selectedBrands.keys.toList().join(','),
                          selectedCountry.keys.toList().join(','),
                          sort: selectedSort,
                          readyStock: readyStock ? 1 : 0,
                          onPromo: onPromo ? 1 : 0,
                        );
                      },
                      child: const Text(
                        'Apply',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showReadyStockOptions() {
    setState(() => readyStock = !readyStock);
    widget.onFilterChanged(
      selectedCategories.keys.toList().join(','),
      selectedBrands.keys.toList().join(','),
      selectedCountry.keys.toList().join(','),
      sort: selectedSort,
      readyStock: readyStock ? 1 : 0,
      onPromo: onPromo ? 1 : 0,
    );
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
    widget.onFilterChanged(
      selectedCategories.keys.toList().join(','),
      selectedBrands.keys.toList().join(','),
      selectedCountry.keys.toList().join(','),
      sort: selectedSort,
      readyStock: readyStock ? 1 : 0,
      onPromo: onPromo ? 1 : 0,
    );

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

  Future _showCategoryOptions() async {
    // final allCategories = ['Electronics', 'Books', 'Fashion', 'Home'];
    var result = await showModalBottomSheet(
        context: context,
        builder: (_) {
          return FilterCategory(
            selectedCategories: selectedCategories,
          );
        });
    if (result != null) {
      setState(() {
        selectedCategories =
            (result['selectedCategories'] as Map<String, Category>);
        widget.onFilterChanged(
          selectedCategories.keys.toList().join(','),
          selectedBrands.keys.toList().join(','),
          selectedCountry.keys.toList().join(','),
          sort: selectedSort,
          readyStock: readyStock ? 1 : 0,
          onPromo: onPromo ? 1 : 0,
        );
      });
    }
  }

  Future _showBrandsOptions() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (_) {
          return FilterBrand(
            selectedBrands: selectedBrands,
            selectedCountries: selectedCountry,
          );
        });
    if (result != null) {
      setState(() {
        selectedBrands = (result['selectedBrands'] as Map<String, Brand>);
        selectedCountry = (result['selectedCountries'] as Map<String, Country>);
        widget.onFilterChanged(
          selectedCategories.keys.toList().join(','),
          selectedBrands.keys.toList().join(','),
          selectedCountry.keys.toList().join(','),
          sort: selectedSort,
          readyStock: readyStock ? 1 : 0,
          onPromo: onPromo ? 1 : 0,
        );
      });
    }
  }

  void _clearFilters() {
    setState(() {
      selectedSort = null;
      onPromo = false;
      readyStock = false;
      selectedCategories.clear();
      selectedBrands.clear();
      selectedCountry.clear();
      widget.onFilterChanged(
        selectedCategories.keys.toList().join(','),
        selectedBrands.keys.toList().join(','),
        selectedCountry.keys.toList().join(','),
      );
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
                  selectedCountry.isNotEmpty ||
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
            OutlinedButton(
              onPressed: _showSortOptions,
              style: OutlinedButton.styleFrom(
                minimumSize: Size(0, 36),
                side: BorderSide(
                  color: selectedSort != null ? Colors.blue : Colors.grey,
                ),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                foregroundColor:
                    selectedSort != null ? Colors.blue : Colors.grey,
              ),
              child: Row(
                children: [
                  Icon(Icons.sort,
                      color: selectedSort != null ? Colors.blue : Colors.grey),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Sort',
                    style: TextStyle(
                        color:
                            selectedSort != null ? Colors.blue : Colors.grey),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: selectedSort != null ? Colors.blue : Colors.black,
                  ),
                ],
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
                        : Colors.black,
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
                    'Brand${selectedBrands.isNotEmpty || selectedCountry.isNotEmpty ? ' (${selectedBrands.length + selectedCountry.length})' : ''}',
                    style: TextStyle(
                        color: selectedBrands.isNotEmpty ||
                                selectedCountry.isNotEmpty
                            ? Colors.blue
                            : Colors.grey),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color:
                        selectedBrands.isNotEmpty ? Colors.blue : Colors.black,
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
