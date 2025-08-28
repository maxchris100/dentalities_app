import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCategory extends StatefulWidget {
  Map<String, Category>? selectedCategories = {};
  FilterCategory({super.key, this.selectedCategories});

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  final Map<String, Category> selectedCategories = {};
  List<Category> specializations = [];
  //  [
  //   "All",
  //   "Accessories",
  //   "Endodontics",
  //   "General Dentistry",
  //   "Imaging",
  //   "Implant & Surgery",
  //   "Orthodontics",
  //   "Periodontics",
  //   "Prosthodontics",
  // ];

  final List<String> treatments = [
    "Root Canal",
    "Tooth Extraction",
    "Cleaning",
    "Whitening",
  ];

  final List<String> productTypes = [
    "Instrument",
    "Material",
    "Equipment",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      HomeCubit homeCubit = context.read<HomeCubit>();
      specializations = homeCubit.data.categories;
      if (widget.selectedCategories != null) {
        selectedCategories.addAll(widget.selectedCategories!);
      }
      setState(() {});
    });
  }

  // String? selectedSpecialization;
  String? selectedTreatment;
  String? selectedProductType;

  Widget buildChipCategory({
    required List<Category> options,
  }) {
    return Container(
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        runSpacing: 0,
        children: options.map((item) {
          final isSelected = selectedCategories[item.id.toString()] != null;
          return ChoiceChip(
            label: Text(
              item.name,
              style: TextStyle(fontSize: 11),
            ),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                if (isSelected) {
                  selectedCategories.remove(item.id.toString());
                } else {
                  final category = specializations.firstWhere(
                      (element) => element.id.toString() == item.id.toString());
                  selectedCategories[category.id.toString()] = category;
                }
              });
            },
            showCheckmark: false,
            selectedColor: Colors.blue,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
            backgroundColor: Colors.grey[200],
          );
        }).toList(),
      ),
    );
  }

  Widget buildChipSelector({
    required List<String> options,
    required String? selectedValue,
    required Function(String) onSelected,
  }) {
    return Container(
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        runSpacing: 0,
        children: options.map((item) {
          final isSelected = selectedValue == item;
          return ChoiceChip(
            label: Text(
              item,
              style: TextStyle(fontSize: 11),
            ),
            selected: isSelected,
            onSelected: (_) => onSelected(item),
            selectedColor: Colors.blue,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
            backgroundColor: Colors.grey[200],
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                "Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              /// Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// SPECIALIZATION
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: const Text(
                          "Specialization",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        dense: true,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                        ),
                        children: [
                          buildChipCategory(
                            options: specializations.map((e) => e).toList(),
                          ),
                        ],
                      ),

                      /// TREATMENT
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: const Text(
                          "Treatment",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        dense: true,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                        ),
                        children: [
                          buildChipSelector(
                            options: treatments,
                            selectedValue: selectedTreatment,
                            onSelected: (val) {
                              setState(() => selectedTreatment = val);
                            },
                          )
                        ],
                      ),

                      /// PRODUCT TYPE
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: const Text(
                          "Product Type",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        dense: true,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                        ),
                        children: [
                          buildChipSelector(
                            options: productTypes,
                            selectedValue: selectedProductType,
                            onSelected: (val) {
                              setState(() => selectedProductType = val);
                            },
                          )
                        ],
                      ),

                      const SizedBox(
                          height: 100), // Kasih jarak biar gak ketutupan tombol
                    ],
                  ),
                ),
              ),

              /// APPLY BUTTON (tetap di bawah)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop({
                      // 'specialization': selectedSpecialization,
                      // 'treatment': selectedTreatment,
                      // 'productType': selectedProductType,
                      'selectedCategories': selectedCategories,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Apply",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
