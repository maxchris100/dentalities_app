import 'package:flutter/material.dart';

class FilterCategory extends StatefulWidget {
  const FilterCategory({super.key});

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  final List<String> specializations = [
    "All",
    "Accessories",
    "Endodontics",
    "General Dentistry",
    "Imaging",
    "Implant & Surgery",
    "Orthodontics",
    "Periodontics",
    "Prosthodontics",
  ];

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

  String selectedSpecialization = "Endodontics";
  String? selectedTreatment;
  String? selectedProductType;

  Widget buildChipSelector({
    required List<String> options,
    required String? selectedValue,
    required Function(String) onSelected,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((item) {
        final isSelected = selectedValue == item;
        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          onSelected: (_) => onSelected(item),
          selectedColor: Colors.blue,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          backgroundColor: Colors.grey[200],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const Text(
              "Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            /// SPECIALIZATION
            ExpansionTile(
              title: const Text(
                "Specialization",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: [
                buildChipSelector(
                  options: specializations,
                  selectedValue: selectedSpecialization,
                  onSelected: (val) {
                    setState(() => selectedSpecialization = val);
                  },
                )
              ],
            ),

            /// TREATMENT
            ExpansionTile(
              title: const Text(
                "Treatment",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              title: const Text(
                "Product Type",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

            const Spacer(),

            /// APPLY BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop({
                    'specialization': selectedSpecialization,
                    'treatment': selectedTreatment,
                    'productType': selectedProductType,
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
                child: const Text("Apply", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
