import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foriyana_app/core/util/date_format.dart';
import 'package:foriyana_app/generated/l10n.dart';
import 'package:foriyana_app/presentation/widgets/on_tap_text.dart';

class FilterDateWidget extends StatefulWidget {
  const FilterDateWidget({super.key});

  @override
  State<FilterDateWidget> createState() => _FilterDateWidgetState();
}

class _FilterDateWidgetState extends State<FilterDateWidget> {
  List filterDateItems = [
    {"name": "Last Updated", "value": "1"},
    {"name": "Last 7 Days", "value": "2"},
    {"name": "Last 30 Days", "value": "3"},
    {"name": "Custom Date", "value": "4"},
  ];
  String? selectedFilterDate = "1";
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future selectFilterDate(String type) async {
    String? selectedDay;
    String? selectedMonth;
    String? selectedYear;

    DateTime? initialDate() {
      if (type == "Start") {
        if (selectedStartDate != null) {
          return selectedStartDate;
        } else {
          return DateTime.now();
        }
      }
      if (type == "End") {
        if (selectedEndDate != null) {
          return selectedEndDate;
        } else {
          return DateTime.now();
        }
      }
      return null;
    }

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select ${type} Date",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  height: 350,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: initialDate(),
                    minimumDate:
                        selectedStartDate != null && type == "End"
                            ? selectedStartDate
                            : null,
                    maximumDate:
                        selectedEndDate != null && type == "Start"
                            ? (DateTime.now().isAfter(selectedEndDate!))
                                ? DateTime.now()
                                : selectedEndDate
                            : DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() {
                        if (type == "Start") {
                          selectedStartDate = newDate;
                        } else {
                          selectedEndDate = newDate;
                        }
                      });
                    },
                  ),
                ),
                // Row(
                //   children: [
                //     Expanded(child: OnTapText(text: "DD")),
                //     SizedBox(
                //       width: 8,
                //     ),
                //     Expanded(child: OnTapText(text: "MM")),
                //     SizedBox(
                //       width: 8,
                //     ),
                //     Expanded(child: OnTapText(text: "YYY")),
                //   ],
                // ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.disabled)) {
                                  return Colors
                                      .grey
                                      .shade300; // warna saat disabled
                                }
                                return Colors.white; // warna aktif
                              }),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Color(0xff0D4290)),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          S.current.close,
                          style: TextStyle(color: Color(0xff0D4290)),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.disabled)) {
                                  return Colors
                                      .grey
                                      .shade300; // warna saat disabled
                                }
                                return Colors.red; // warna aktif
                              }),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed:
                        //  selectedDay == null ||
                        //         selectedMonth == null ||
                        //         selectedYear == null
                        //     ? null
                        // :
                        () {
                          if (type == "Start") {
                            if (selectedStartDate == null) {
                              selectedStartDate = DateTime.now();
                            }
                          } else {
                            if (selectedEndDate == null) {
                              selectedEndDate = DateTime.now();
                            }
                          }
                          Navigator.pop(context);
                        },
                        child: Text(
                          S.current.save,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Select Date",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),
          Column(
            children:
                filterDateItems.asMap().entries.map((e) {
                  final item = e.value;
                  return ListTile(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    selectedColor: Colors.transparent,
                    selectedTileColor: Colors.transparent,
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {
                      setState(() {
                        selectedFilterDate = item["value"];
                      });
                    },
                    title: Text(item["name"]),
                    trailing: Radio<dynamic>(
                      activeColor: Colors.red,
                      value: item["value"],
                      groupValue: selectedFilterDate,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedFilterDate = value!;
                        });
                      },
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 12),
          Visibility(
            visible: selectedFilterDate == "4",
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: OnTapText(
                        text:
                            selectedStartDate == null
                                ? "Start Date"
                                : DateUtil.formatDateIndonesian(
                                  selectedStartDate!,
                                ),
                        onTap: () {
                          selectFilterDate("Start").then((e) {
                            setState(() {});
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: OnTapText(
                        text:
                            selectedEndDate == null
                                ? "End Date"
                                : DateUtil.formatDateIndonesian(
                                  selectedEndDate!,
                                ),
                        color:
                            selectedStartDate == null
                                ? Color.fromARGB(255, 232, 232, 232)
                                : Color(0xffFAFAFA),
                        onTap:
                            selectedStartDate == null
                                ? null
                                : () {
                                  selectFilterDate("End").then((e) {
                                    setState(() {});
                                  });
                                },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.grey.shade300; // warna saat disabled
                      }
                      return Colors.white; // warna aktif
                    }),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Color(0xff0D4290)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.current.close,
                    style: TextStyle(color: Color(0xff0D4290)),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
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
                  onPressed:
                      selectedFilterDate == "4" &&
                              selectedStartDate == null &&
                              selectedEndDate == null
                          ? null
                          : () {
                            Navigator.pop(context, {
                              "value": selectedFilterDate,
                              "start_date":
                                  selectedStartDate != null
                                      ? DateUtil.formatQuery(selectedStartDate!)
                                      : null,
                              "end_date":
                                  selectedEndDate != null
                                      ? DateUtil.formatQuery(selectedEndDate!)
                                      : null,
                            });
                          },
                  child: Text(
                    S.current.save,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
