import 'package:flutter/material.dart';
import 'package:lifestyle/utils/constants.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hesabınızı Olusturalım",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white),
          ),
          Text(
            "Kayıt bilgileriniz size özel ve güvenle korunmaktadır",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: secondTextColor),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: nameController,
                  enabled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.black45)),
                  validator: (value) {},
                ),
                TextFormField(
                  controller: emailControler,
                  enabled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black45)),
                  validator: (value) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
