import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle/utils/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({super.key});

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  double height = 0;
  double weight = 0;
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
  Color color = Color(0xFFff6666);
  Color _color = Color(0xFF007f5c);
  int colorIndex = 0;

  PageController controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    Text("Fiziksel Özellikleriniz nelerdir"),
                    Container(
                      child: Padding(
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
                                              fontWeight: FontWeight.bold),
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
                                        Chip(
                                            label: Text(
                                                height.toInt().toString() +
                                                    "cm"))
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SfSlider(
                                          inactiveColor: Colors.grey,
                                          activeColor: Colors.white,
                                          min: 50.0,
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
                                        Chip(
                                            label: Text(
                                                weight.toInt().toString() +
                                                    "kg"))
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
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black45))),
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Chip(
                                          label: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black45))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'What is your body type?',
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
                                        items: items
                                            .map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue = value;
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
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor:
                                              Color.fromARGB(255, 201, 18, 88),
                                          iconDisabledColor: Colors.grey,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          maxHeight: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: Colors.white,
                                          ),
                                          offset: const Offset(-20, 0),
                                          scrollbarTheme: ScrollbarThemeData(
                                            radius: const Radius.circular(40),
                                            thickness: MaterialStateProperty
                                                .all<double>(6),
                                            thumbVisibility:
                                                MaterialStateProperty.all<bool>(
                                                    true),
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
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black45))),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'What is your body type?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: mainThemeColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      ActionChip(
                                        backgroundColor: color,
                                        onPressed: () {
                                          setState(() {
                                            colorIndex++;
                                            colorIndex.isEven == true
                                                ? color = color
                                                : color = _color;
                                          });
                                        },
                                        label: Text(
                                          "Cigarette",
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          )),
    );
  }
}
