import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
import 'package:dentalities/presentation/widgets/search_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProfileChangeProfilePage extends StatefulWidget {
  const ProfileChangeProfilePage({super.key});

  @override
  State<ProfileChangeProfilePage> createState() =>
      _ProfileChangeProfilePageState();
}

class _ProfileChangeProfilePageState extends State<ProfileChangeProfilePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController prefixController = TextEditingController();
  TextEditingController suffixController = TextEditingController();

  String? selectedSalutation;
  bool onSubmit = false;

  ProfileCubit? profileCubit;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        profileCubit = args["profileCubit"];
      }

      fullNameController.text =
          Constant.userLocalDataSource.userData?.fullName ?? "";
      prefixController.text =
          Constant.userLocalDataSource.userData?.titlePrefix ?? "";
      suffixController.text =
          Constant.userLocalDataSource.userData?.titleSuffix ?? "";
      selectedSalutation =
          Constant.userLocalDataSource.userData?.salutation ?? "";

      setState(() {});
    });
  }

  Future onSave() async {
    setState(() => onSubmit = true);
    if (_formKey.currentState!.validate()) {
      String name = fullNameController.text.trim();
      var res = await profileCubit?.updateProfileData(
          email: Constant.userLocalDataSource.userData!.email!,
          name: name,
          phoneCode: '62',
          phoneNumber: Constant.userLocalDataSource.userData!.phone ?? "");
      setState(() => onSubmit = false);
      if (res["status"]) {
        ToastUtil.showToast("", res["message"]);
      } else {
        ToastUtil.showToastError("", res["message"]);
      }
      return;
    }

    setState(() => onSubmit = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Personal Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Full Name
              const Text("Full Name"),
              const SizedBox(height: 8),
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full Name is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Salutation
              const Text("Salutation"),
              const SizedBox(height: 8),
              BottomSheetSelector<String>(
                label: "Salutation",
                selectedValue: selectedSalutation,
                items: ['Mr.', 'Mrs.', 'Dr.', 'Prof.'],
                onSelected: (value) =>
                    setState(() => selectedSalutation = value),
              ),
              Visibility(
                visible: onSubmit && selectedSalutation == null,
                child: Text(
                  "Salutation is required",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 12),

              // Prefix Title
              const Text("Prefix Title"),
              const SizedBox(height: 8),
              TextFormField(
                controller: prefixController,
                decoration: InputDecoration(
                  hintText: 'Prefix',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Prefix Title is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Suffix Title
              const Text("Suffix Title"),
              const SizedBox(height: 8),
              TextFormField(
                controller: suffixController,
                decoration: InputDecoration(
                  hintText: 'Suffix Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Suffix Title is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    onSave();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
