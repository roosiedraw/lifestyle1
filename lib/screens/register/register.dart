import 'package:flutter/material.dart';
import 'package:lifestyle/screens/register/registerPage2.dart';
import 'package:lifestyle/utils/constants.dart';

/*
1.sayfa(couple,bull,lgbtq,hetero)
2.sayfa(isim,email)
3.sayfa(foto,boy kilo,yaş,ten rengi,dövme,piercing,sigara&alkol,vücut tipi,)
4.sayfa(interest)

6.payment
7.bilgilendirme tanıtım.şartlar koşullar.
 */
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  int pageIndex = 0;
  bool isvisible = false;
  double values = 0.0;

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
                              value: values);
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: mainThemeColor,
        body: SafeArea(
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Register Screen Top Bar

              //Register Screen Pages
              Expanded(
                flex: 10,
                child: Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.black45)),
                              onEditingComplete: () {
                                setState(() {
                                  values = 0.15;
                                });
                              },
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black45)),
                              onEditingComplete: () {
                                setState(() {
                                  values = 0.3;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterPage2(values: values)));
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //Register Screen Buttons
            ],
          ),
        )),
      ),
    );
  }
}
