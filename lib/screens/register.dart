import 'package:flutter/material.dart';
import 'package:lifestyle/utils/constants.dart';
import 'package:lifestyle/widgets/registerPage2.dart';
import 'package:lifestyle/widgets/registerPage3.dart';
import 'package:lifestyle/widgets/registerpage1.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
  int pageIndex = 0;
  bool isvisible = false;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Register Screen Top Bar
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black45))),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      pageIndex != 0
                          ? Image(
                              image: AssetImage("assets/images/lgbt.png"),
                              height: 20,
                            )
                          : Image(
                              image: AssetImage("assets/images/lgbt.png"),
                              height: 30,
                            ),
                      Container(
                          width: 50,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 4),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromARGB(255, 133, 3, 46),
                                  minHeight: 8,
                                  value: pageIndex < 1 ? 0 : 1);
                            },
                          )),
                      pageIndex != 1
                          ? Image(
                              image: AssetImage("assets/images/phone.png"),
                              height: 20,
                            )
                          : Image(
                              image: AssetImage("assets/images/phone.png"),
                              height: 30,
                            ),
                      Container(
                          width: 50,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromARGB(255, 133, 3, 46),
                                  minHeight: 8,
                                  value: pageIndex < 2 ? 0 : 1);
                            },
                          )),
                      pageIndex != 2
                          ? Image(
                              image: AssetImage("assets/images/slim-body.png"),
                              height: 20,
                            )
                          : Image(
                              image: AssetImage("assets/images/slim-body.png"),
                              height: 30,
                            ),
                      Container(
                          width: 50,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromARGB(255, 133, 3, 46),
                                  minHeight: 8,
                                  value: pageIndex < 3 ? 0 : 1);
                            },
                          )),
                      pageIndex != 3
                          ? Image(
                              image: AssetImage("assets/images/lips.png"),
                              height: 20,
                            )
                          : Image(
                              image: AssetImage("assets/images/lips.png"),
                              height: 30,
                            ),
                    ],
                  ),
                ),
              ),
            ),

            //Register Screen Pages
            Expanded(
              flex: 10,
              child: Container(
                child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (value) {
                      setState(() {
                        pageIndex;
                      });
                    },
                    controller: pageController,
                    children: [
                      RegisterPage1(),
                      RegisterPage2(),
                      RegisterPage3(),
                      Center(child: Text("4"))
                    ]),
              ),
            ),

            //Register Screen Buttons
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: isvisible,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(fixedSize: Size(50, 30)),
                          onPressed: () {
                            setState(() {
                              pageIndex--;
                              pageIndex == 0
                                  ? print("s") //Ödeme sayfasına devam
                                  : pageIndex;
                              pageIndex != 0
                                  ? print("s") //Ödeme sayfasına devam
                                  : isvisible = false;
                              pageController.animateToPage(pageIndex,
                                  curve: Curves.ease,
                                  duration: Duration(seconds: 1));

                              print(pageIndex);
                            });
                          },
                          child: Icon(Icons.arrow_back_ios_new)),
                    ),
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(fixedSize: Size(50, 30)),
                        onPressed: () {
                          setState(() {
                            pageIndex++;
                            pageIndex == 4
                                ? print("devamke") //Ödeme sayfasına devam
                                : pageIndex;
                            isvisible = true;
                            pageController.animateToPage(pageIndex,
                                curve: Curves.ease,
                                duration: Duration(seconds: 1));

                            print(pageIndex);
                          });
                        },
                        child: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
