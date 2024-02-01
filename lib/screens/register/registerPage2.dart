// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle/screens/register/registerPage3.dart';
import 'package:lifestyle/utils/constants.dart';

class RegisterPage2 extends StatefulWidget {
  double values = 0.0;
  RegisterPage2({required this.values});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  String selectedValuesex = "Couple";
  final List<String> itemssex = [
    'Couple',
    'Bull',
  ];
  double values2 = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values2 = widget.values;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Tab(
          child: Container(
            decoration: BoxDecoration(
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
                              color: Color.fromARGB(255, 133, 3, 46),
                              minHeight: 8,
                              value: values2);
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: mainThemeColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sizi Daha Yakından Tanıyalım",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: secondTextColor),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.list_rounded,
                        size: 16,
                        color: mainThemeColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Your Sexual Orientation',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: mainThemeColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: itemssex
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValuesex,
                  onChanged: (String? value) {
                    setState(() {
                      values2 = 0.5;
                      selectedValuesex = value!;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage3(
                                  values: values2,
                                  selectedValuesex: selectedValuesex)));
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 220,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Color.fromARGB(255, 201, 18, 88),
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    offset: const Offset(-20, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
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
