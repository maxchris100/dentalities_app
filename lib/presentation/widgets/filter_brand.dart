import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/country_model.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBrand extends StatefulWidget {
  Map<String, Brand>? selectedBrands = {};
  FilterBrand({super.key, this.selectedBrands});

  @override
  _FilterBrandState createState() => _FilterBrandState();
}

class _FilterBrandState extends State<FilterBrand> {
  final Map<String, Country> selectedCountries = {};
  final Map<String, Brand> selectedBrands = {};
  // final List<Country> selectedCountries = [];
  // final List<Brand> selectedBrands = [];

  List<Brand> brands = [];
  List<Country> countries = [];
  // final List<Country> countries = [
  //   {'name': 'China', 'flag': '🇨🇳'},
  //   {'name': 'France', 'flag': '🇫🇷'},
  //   {'name': 'Taiwan', 'flag': '🇹🇼'},
  //   {'name': 'UK', 'flag': '🇬🇧'},
  //   // Tambah jika perlu
  // ];

  // final List<Map<String, String>> brands = [
  //   {'name': 'ITENA', 'image': 'assets/images/banner.png'},
  //   {'name': 'ACTEON', 'image': 'assets/images/banner.png'},
  //   {'name': 'SEMORR', 'image': 'assets/images/banner.png'},
  //   {'name': 'SOPRO', 'image': 'assets/images/banner.png'},
  // ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      HomeCubit homeCubit = context.read<HomeCubit>();
      brands = homeCubit.data.brands;
      countries = homeCubit.data.countries;
      if (widget.selectedBrands != null) {
        selectedBrands.addAll(widget.selectedBrands!);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          Text("Brand",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),

          // Horizontal scrollable country chips
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: countries.map((country) {
          //       final isSelected =
          //           selectedCountries[country.id.toString()] != null;
          //       return Padding(
          //         padding: const EdgeInsets.only(right: 8.0),
          //         child: ChoiceChip(
          //           label: Text(country.name),
          //           selected: isSelected,
          //           onSelected: (_) {
          //             setState(() {
          //               isSelected
          //                   ? selectedCountries.remove(country.id.toString())
          //                   : selectedCountries.putIfAbsent(
          //                       country.id.toString(), () => country);
          //             });
          //           },
          //           selectedColor: Colors.blue.shade100,
          //           shape: StadiumBorder(
          //             side: BorderSide(
          //               color: isSelected ? Colors.blue : Colors.grey.shade300,
          //             ),
          //           ),
          //         ),
          //       );
          //     }).toList(),
          //   ),
          // ),

          // const SizedBox(height: 24),

          // Brand Grid
          Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.8,
                children: brands.map((brand) {
                  final isSelected =
                      selectedBrands[brand.id.toString()] != null;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected
                            ? selectedBrands.remove(brand.id.toString())
                            : selectedBrands.putIfAbsent(
                                brand.id.toString(), () => brand);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              isSelected ? Colors.blue : Colors.grey.shade300,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // padding: const EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          brand.featureImageUrl ?? "",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/banner.png",
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 10),

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
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Apply",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
