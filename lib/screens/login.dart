import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lifestyle/screens/register/register.dart';
import 'package:lifestyle/utils/constants.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneNumberController = TextEditingController();
  bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FlutterLogo(size: 200),
                    Text(
                      textAlign: TextAlign.center,
                      "Welcome our apps.this is best app for you",
                      style: TextStyle(
                        color: mainTextColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SignInButton(
                      padding: EdgeInsets.all(4),
                      shape: StadiumBorder(),
                      Buttons.google,
                      text: "Sign In With Google",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                        },
                        child: Text(
                          "Sign In With Cell Phone Number",
                          style: TextStyle(
                              color: secondTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                    Visibility(
                        visible: isvisible,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: secondTextColor),
                          width: MediaQuery.of(context).size.width * 0.67,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: IntlPhoneField(
                                  dropdownTextStyle: TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                      hintText: "", counterText: ""),
                                  keyboardType: TextInputType.phone,
                                  initialCountryCode: "US",
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  keyboardAppearance: Brightness.dark,
                                  keyboardType: TextInputType.phone,
                                  maxLines: 1,
                                  onEditingComplete: () {
                                    //Numarayı veritabanından kontrol et.Üyelik varsa giriş yap yoksa üye ola yönlendir
                                  },
                                  controller: phoneNumberController,
                                  cursorOpacityAnimates: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
