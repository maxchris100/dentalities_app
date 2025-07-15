import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _currentStep = 0;

  // Form Data Controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();
  String? selectedSalutation;
  final prefixController = TextEditingController();
  final suffixController = TextEditingController();

  String? selectedProvince;
  String? selectedCity;
  String? selectedDistrict;
  String? selectedSubDistrict;
  final postalController = TextEditingController();
  final addressController = TextEditingController();

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _register() {
    // TODO: Add registration logic
    print("Account Created");
  }

  Widget _stepIndicator(String title, int step) {
    bool isActive = _currentStep == step;
    bool isCompleted = _currentStep > step;

    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_checked,
          color: isCompleted || isActive ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(title),
        if (step < 2)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.arrow_forward_ios, size: 14),
          ),
      ],
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Account Informations",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Personal Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedSalutation,
              decoration: const InputDecoration(labelText: 'Salutation'),
              items: ['Mr.', 'Mrs.', 'Dr.', 'Prof.']
                  .map((salut) =>
                      DropdownMenuItem(value: salut, child: Text(salut)))
                  .toList(),
              onChanged: (val) => setState(() => selectedSalutation = val),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: prefixController,
              decoration: const InputDecoration(labelText: 'Prefix Title'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: suffixController,
              decoration: const InputDecoration(labelText: 'Suffix Title'),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            buildProvinceSelector(context),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedCity,
              decoration: const InputDecoration(labelText: 'City/Regency'),
              items: ['Bandung', 'Bekasi', 'Semarang']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedCity = val),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedDistrict,
              decoration: const InputDecoration(labelText: 'District'),
              items: ['District A', 'District B']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedDistrict = val),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedSubDistrict,
              decoration:
                  const InputDecoration(labelText: 'Sub-district/Village'),
              items: ['Village X', 'Village Y']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedSubDistrict = val),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: postalController,
              decoration: const InputDecoration(labelText: 'Postal Code'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Full Address'),
              maxLines: 2,
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Future<void> showProvincePicker({
    required BuildContext context,
    required List<String> provinces,
    required Function(String) onSelected,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredProvinces = [...provinces];

        return StatefulBuilder(
          builder: (context, setState) {
            void _filterProvinces(String query) {
              setState(() {
                filteredProvinces = provinces
                    .where((p) => p.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              });
            }

            return SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Province",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: searchController,
                      onChanged: _filterProvinces,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
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
                        itemCount: filteredProvinces.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final province = filteredProvinces[index];
                          return ListTile(
                            title: Text(province),
                            onTap: () {
                              onSelected(province);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildProvinceSelector(BuildContext context) {
    List<String> provinces = [
      'Aceh', 'Bali', 'Bangka Belitung', 'Banten', 'Bengkulu',
      'DI Yogyakarta', 'DKI Jakarta', 'Gorontalo', 'Jambi'
      // Tambah sesuai kebutuhan
    ];

    return GestureDetector(
      onTap: () {
        showProvincePicker(
          context: context,
          provinces: provinces,
          onSelected: (value) {
            setState(() {
              selectedProvince = value;
            });
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedProvince ?? "Select Province",
              style: TextStyle(
                fontSize: 16,
                color: selectedProvince == null ? Colors.grey : Colors.black,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1FD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Registration",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text("Complete the informations to create your account"),
              const SizedBox(height: 20),

              // Step Indicator
              Row(
                children: [
                  _stepIndicator("Account", 0),
                  _stepIndicator("Personal", 1),
                  _stepIndicator("Address", 2),
                ],
              ),
              const SizedBox(height: 24),

              // Dynamic Step Content
              _buildStepContent(),
              const SizedBox(height: 30),

              // Action Buttons
              Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _prevStep,
                        child: const Text("Previous"),
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _currentStep == 2 ? _register : _nextStep,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(_currentStep == 2 ? "Register" : "Next"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Already have an account? Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
