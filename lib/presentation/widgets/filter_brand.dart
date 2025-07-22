import 'package:flutter/material.dart';

class FilterBrand extends StatefulWidget {
  @override
  _FilterBrandState createState() => _FilterBrandState();
}

class _FilterBrandState extends State<FilterBrand> {
  final List<String> selectedCountries = [];
  final List<String> selectedBrands = [];

  final List<Map<String, String>> countries = [
    {'name': 'China', 'flag': '🇨🇳'},
    {'name': 'France', 'flag': '🇫🇷'},
    {'name': 'Taiwan', 'flag': '🇹🇼'},
    {'name': 'UK', 'flag': '🇬🇧'},
    // Tambah jika perlu
  ];

  final List<Map<String, String>> brands = [
    {'name': 'ITENA', 'image': 'assets/images/banner.png'},
    {'name': 'ACTEON', 'image': 'assets/images/banner.png'},
    {'name': 'SEMORR', 'image': 'assets/images/banner.png'},
    {'name': 'SOPRO', 'image': 'assets/images/banner.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Country Title
          Text("Brand",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),

          // Horizontal scrollable country chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: countries.map((country) {
                final isSelected = selectedCountries.contains(country['name']);
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text("${country['flag']} ${country['name']}"),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        isSelected
                            ? selectedCountries.remove(country['name'])
                            : selectedCountries.add(country['name']!);
                      });
                    },
                    selectedColor: Colors.blue.shade100,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: isSelected ? Colors.blue : Colors.grey.shade300,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 24),

          // Brand Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.8,
            children: brands.map((brand) {
              final isSelected = selectedBrands.contains(brand['name']);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected
                        ? selectedBrands.remove(brand['name'])
                        : selectedBrands.add(brand['name']!);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    brand['image']!,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'selectedCountries': selectedCountries,
                  'selectedBrands': selectedBrands,
                });
              },
              child: Text("Apply"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
