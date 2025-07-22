import 'package:flutter/material.dart';

class FilterPrice extends StatefulWidget {
  const FilterPrice({super.key});

  @override
  State<FilterPrice> createState() => _FilterPriceState();
}

class _FilterPriceState extends State<FilterPrice> {
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  int? selectedChipIndex;

  final List<Map<String, int>> priceRanges = [
    {'min': 100000, 'max': 500000},
    {'min': 500000, 'max': 1000000},
    {'min': 1000000, 'max': 5000000},
    {'min': 5000000, 'max': 10000000},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Price",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Text("Highest"),
          TextField(
            controller: _maxController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "Rp ",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const Text("Lowest"),
          TextField(
            controller: _minController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "Rp ",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(priceRanges.length, (index) {
              final range = priceRanges[index];
              final isSelected = selectedChipIndex == index;
              final label =
                  'Rp${_formatRp(range['min']!)} - Rp${_formatRp(range['max']!)}';

              return ChoiceChip(
                label: Text(label),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedChipIndex = index;
                    _minController.text = range['min']!.toString();
                    _maxController.text = range['max']!.toString();
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                final min = _minController.text;
                final max = _maxController.text;
                Navigator.pop(context, {'min': min, 'max': max});
              },
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }

  String _formatRp(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(0)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    }
    return value.toString();
  }
}
