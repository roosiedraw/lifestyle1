import 'package:flutter/material.dart';
import 'package:lifestyle/utils/constants.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({super.key});

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  List<bool> isSelected = [true, false];
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
              Center(
                child: ToggleButtons(
                  color: secondTextColor,
                  selectedColor: mainTextColor,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'You',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Your Partner',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      if (index == 1) {
                        controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      } else {
                        controller.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
