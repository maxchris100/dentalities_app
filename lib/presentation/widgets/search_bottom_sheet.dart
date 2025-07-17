import 'package:flutter/material.dart';

class BottomSheetSelector<T> extends StatelessWidget {
  final String? label;
  final T? selectedValue;
  final List<T> items;
  final void Function(T) onSelected;
  final String Function(T)? itemLabel;

  const BottomSheetSelector({
    super.key,
    this.label,
    required this.selectedValue,
    required this.items,
    required this.onSelected,
    this.itemLabel,
  });

  @override
  Widget build(BuildContext context) {
    final getLabel = itemLabel ?? (T item) => item.toString();

    return GestureDetector(
      onTap: () {
        SearchableBottomSheetPicker.show<T>(
          context: context,
          items: items,
          itemLabel: getLabel,
          title: "Select $label",
          searchHint: "Search $label",
          onSelected: onSelected,
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue != null
                  ? getLabel(selectedValue!)
                  : 'Select $label',
              style: TextStyle(
                fontSize: 16,
                color: selectedValue == null ? Colors.grey : Colors.black,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}

class SearchableBottomSheetPicker<T> {
  static Future<void> show<T>({
    required BuildContext context,
    required List<T> items,
    required String Function(T) itemLabel,
    required void Function(T) onSelected,
    String title = "Select Item",
    String searchHint = "Search",
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<T> filteredItems = [...items];

        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8, // 80% tinggi awal
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                void _filterItems(String query) {
                  setState(() {
                    filteredItems = items
                        .where((item) => itemLabel(item)
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: searchController,
                        onChanged: _filterItems,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: searchHint,
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          itemCount: filteredItems.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            return ListTile(
                              title: Text(itemLabel(item)),
                              onTap: () {
                                onSelected(item);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
