// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle/screens/register/registerPage4.dart';
import 'package:lifestyle/screens/register/registerPage5.dart';
import 'package:lifestyle/utils/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RegisterPage3 extends StatefulWidget {
  double values = 0.0;
  String selectedValuesex = "";
  RegisterPage3({required this.values, required this.selectedValuesex});

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  double height = 50;
  double weight = 20;
  String birthDateInString = "";
  bool isDateSelected = false;
  DateTime birthDate = DateTime(2015, 01, 01);
  final List<String> items = [
    'Muscular',
    'Athletic',
    'Fit',
    'Average',
    'Slightly overweight',
    'Chubby',
    'Fat',
    'Other',
  ];
  String? selectedValue;
  Color color = const Color.fromARGB(255, 236, 220, 220);
  Color color2 = const Color.fromARGB(255, 236, 220, 220);
  Color color3 = const Color.fromARGB(255, 236, 220, 220);
  Color color4 = const Color.fromARGB(255, 236, 220, 220);
  bool isColorSelected = false;
  bool isColorSelected2 = false;
  bool isColorSelected3 = false;
  bool isColorSelected4 = false;
  double values3 = 0.0;
  bool isvisible = false;
  @override
  void initState() {
    // TODO: implement initState
    widget.selectedValuesex == "Couple" ? isvisible = true : isvisible = false;
    super.initState();
    values3 = widget.values;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Tab(
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black45))),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TweenAnimationBuilder(
                        tween: Tween(
                            end:
                                0.01), // change this from 0.0 to 1.0 and hot reload
                        duration: const Duration(seconds: 1),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromARGB(255, 133, 3, 46),
                              minHeight: 8,
                              value: values3);
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: mainThemeColor,
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //First partner
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Kayıt bilgileriniz size özel ve güvenle korunmaktadır",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: secondTextColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Height:",
                                                style: TextStyle(
                                                    color: mainTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SfSlider.vertical(
                                                inactiveColor: Colors.grey,
                                                activeColor: Colors.white,
                                                min: 50.0,
                                                max: 220.0,
                                                value: height,
                                                showTicks: false,
                                                showLabels: false,
                                                enableTooltip: true,
                                                minorTicksPerInterval: 1,
                                                onChanged: (dynamic value) {
                                                  setState(() {
                                                    height = value;
                                                  });
                                                },
                                              ),
                                              Column(
                                                children: [
                                                  Chip(
                                                      label: Text((height *
                                                                  0.0328)
                                                              .toStringAsFixed(
                                                                  2)
                                                              .toString() +
                                                          "ft")),
                                                  Chip(
                                                      label: Text(height
                                                              .toInt()
                                                              .toString() +
                                                          "cm")),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Weight:",
                                                style: TextStyle(
                                                    color: mainTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SfSlider(
                                                inactiveColor: Colors.grey,
                                                activeColor: Colors.white,
                                                min: 20.0,
                                                max: 220.0,
                                                value: weight,
                                                showTicks: false,
                                                showLabels: false,
                                                enableTooltip: true,
                                                minorTicksPerInterval: 1,
                                                onChanged: (dynamic value) {
                                                  setState(() {
                                                    weight = value;
                                                  });
                                                },
                                              ),
                                              Column(
                                                children: [
                                                  Chip(
                                                      label: Text((weight *
                                                                  2.20)
                                                              .floorToDouble()
                                                              .toString() +
                                                          "lbs")),
                                                  Chip(
                                                      label: Text(weight
                                                              .toInt()
                                                              .toString() +
                                                          "kg")),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black45))),
                                    ),
                                  ),
                                  GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Birthday:",
                                              style: TextStyle(
                                                  color: mainTextColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Chip(
                                                label: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    new Icon(
                                                      Icons.calendar_today,
                                                      color: mainThemeColor,
                                                    ),
                                                    Text(birthDateInString)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () async {
                                        final datePick = await showDatePicker(
                                            context: context,
                                            initialDate: new DateTime.now(),
                                            firstDate: new DateTime(1900),
                                            lastDate: new DateTime(2100));
                                        if (datePick != null &&
                                            datePick != birthDate) {
                                          setState(() {
                                            birthDate = datePick;
                                            isDateSelected = true;

                                            // put it here
                                            birthDateInString =
                                                "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
                                          });
                                        }
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black45))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Body Type:",
                                          style: TextStyle(
                                              color: mainTextColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              isExpanded: true,
                                              hint: Row(
                                                children: [
                                                  Icon(
                                                    Icons.list_rounded,
                                                    size: 16,
                                                    color: mainThemeColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'What is your body type?',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: mainThemeColor,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: items
                                                  .map((String item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: selectedValue,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  selectedValue = value;
                                                  values3 = 0.8;
                                                });
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                height: 50,
                                                width: 220,
                                                padding: const EdgeInsets.only(
                                                    left: 14, right: 14),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  border: Border.all(
                                                    color: Colors.black26,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                elevation: 2,
                                              ),
                                              iconStyleData:
                                                  const IconStyleData(
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                ),
                                                iconSize: 14,
                                                iconEnabledColor:
                                                    Color.fromARGB(
                                                        255, 201, 18, 88),
                                                iconDisabledColor: Colors.grey,
                                              ),
                                              dropdownStyleData:
                                                  DropdownStyleData(
                                                maxHeight: 200,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color: Colors.white,
                                                ),
                                                offset: const Offset(-20, 0),
                                                scrollbarTheme:
                                                    ScrollbarThemeData(
                                                  radius:
                                                      const Radius.circular(40),
                                                  thickness:
                                                      MaterialStateProperty.all<
                                                          double>(6),
                                                  thumbVisibility:
                                                      MaterialStateProperty.all<
                                                          bool>(true),
                                                ),
                                              ),
                                              menuItemStyleData:
                                                  const MenuItemStyleData(
                                                height: 40,
                                                padding: EdgeInsets.only(
                                                    left: 14, right: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black45))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'More Spesific Things..',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: mainTextColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ActionChip(
                                                backgroundColor: color,
                                                onPressed: () {
                                                  setState(() {
                                                    isColorSelected =
                                                        !isColorSelected;
                                                    isColorSelected == true
                                                        ? color = const Color
                                                            .fromARGB(
                                                            255, 236, 220, 220)
                                                        : color = const Color
                                                            .fromARGB(
                                                            255, 35, 224, 76);
                                                  });
                                                },
                                                label: const Text(
                                                  "Cigarette",
                                                ),
                                              ),
                                              ActionChip(
                                                backgroundColor: color2,
                                                onPressed: () {
                                                  setState(() {
                                                    isColorSelected2 =
                                                        !isColorSelected2;
                                                    isColorSelected2 == true
                                                        ? color2 = const Color
                                                            .fromARGB(
                                                            255, 236, 220, 220)
                                                        : color2 = const Color
                                                            .fromARGB(
                                                            255, 35, 224, 76);
                                                  });
                                                },
                                                label: const Text(
                                                  "Alcohol",
                                                ),
                                              ),
                                              ActionChip(
                                                backgroundColor: color3,
                                                onPressed: () {
                                                  setState(() {
                                                    isColorSelected3 =
                                                        !isColorSelected3;
                                                    isColorSelected3 == true
                                                        ? color3 = const Color
                                                            .fromARGB(
                                                            255, 236, 220, 220)
                                                        : color3 = const Color
                                                            .fromARGB(
                                                            255, 35, 224, 76);
                                                  });
                                                },
                                                label: const Text(
                                                  "Tattoo",
                                                ),
                                              ),
                                              ActionChip(
                                                backgroundColor: color4,
                                                onPressed: () {
                                                  setState(() {
                                                    isColorSelected4 =
                                                        !isColorSelected4;
                                                    isColorSelected4 == true
                                                        ? color4 = const Color
                                                            .fromARGB(
                                                            255, 236, 220, 220)
                                                        : color4 = const Color
                                                            .fromARGB(
                                                            255, 35, 224, 76);
                                                  });
                                                },
                                                label: const Text(
                                                  "Piercing ",
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black45))),
                                    ),
                                  ),
                                  Visibility(
                                      visible: isvisible,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage4(
                                                            values: values3)));
                                          },
                                          child: const Text("Your Partner"))),
                                  Visibility(
                                      visible: !isvisible,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage5(
                                                            values: values3)));
                                          },
                                          child: const Icon(
                                              Icons.arrow_forward_ios_sharp)))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
