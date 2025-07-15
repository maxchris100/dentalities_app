import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:foriyana_app/generated/l10n.dart';
import 'package:foriyana_app/presentation/blocs/cubit/language_cubit.dart';

final List<Map<String, String>> flagItems = [
  {'asset': 'assets/icons/flags/us.svg', 'code': 'en', 'title': 'English'},
  {'asset': 'assets/icons/flags/id.svg', 'code': 'id', 'title': 'Indonesia'},
  {'asset': 'assets/icons/flags/my.svg', 'code': 'ms', 'title': 'Malay'},
  {'asset': 'assets/icons/flags/ph.svg', 'code': 'fil', 'title': 'Tagalog'},
  {'asset': 'assets/icons/flags/th.svg', 'code': 'th', 'title': 'Thai'},
  {'asset': 'assets/icons/flags/sg.svg', 'code': 'en', 'title': 'Singapore'},
];

String getPhoneCode(String selectedLocal) {
  if (selectedLocal == "en") {
    return "";
  } else if (selectedLocal == "id") {
    return "62";
  } else if (selectedLocal == "ms") {
    return "60";
  } else if (selectedLocal == "sg") {
    return "65";
  } else if (selectedLocal == "fil") {
    return "63";
  } else if (selectedLocal == "th") {
    return "66";
  }
  return "";
}

String getFlagCode(String selectedLocal) {
  if (selectedLocal == "en") {
    return "assets/icons/flags/us.svg";
  } else if (selectedLocal == "id") {
    return "assets/icons/flags/id.svg";
  } else if (selectedLocal == "ms") {
    return "assets/icons/flags/my.svg";
  } else if (selectedLocal == "sg") {
    return "assets/icons/flags/sg.svg";
  } else if (selectedLocal == "fil") {
    return "assets/icons/flags/ph.svg";
  } else if (selectedLocal == "th") {
    return "assets/icons/flags/th.svg";
  }
  return "";
}

class FilterLanguage extends StatefulWidget {
  const FilterLanguage({super.key});

  @override
  State<FilterLanguage> createState() => _FilterLanguageState();
}

class _FilterLanguageState extends State<FilterLanguage> {
  String selectedLocal = UserLocalDataSource.language;

  @override
  Widget build(BuildContext ctx) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: flagItems.map((item) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLocal = item["code"].toString();
                  });
                  context.read<LanguageCubit>().switchLanguage(
                        item["code"].toString(),
                      );
                  log("@SWITCH LANGUAGE: ${UserLocalDataSource.language}");
                  Navigator.pop(ctx, selectedLocal);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SvgPicture.asset(
                            item["asset"].toString(),
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(child: Text(item["title"].toString())),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>((
                  states,
                ) {
                  if (states.contains(WidgetState.disabled)) {
                    return Colors.grey.shade300; // warna saat disabled
                  }
                  return Colors.red; // warna aktif
                }),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                S.current.cancel,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
