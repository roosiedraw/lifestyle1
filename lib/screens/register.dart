import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

/*
1.sayfa(couple,bull,lgbtq,hetero)
2.sayfa(isim)
3.sayfa(boy kilo,yaş,ten rengi,dövme,piercing,sigara&alkol,vücut tipi,)
4.sayfa(interest)
5.sayfa(email)
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      pageIndex != 0
                          ? Icon(
                              Icons.home,
                              size: 15,
                            )
                          : HeartbeatProgressIndicator(
                              child: Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                      Container(
                          width: 50,
                          color: Colors.white,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  value: pageIndex < 1 ? 0 : 1);
                            },
                          )),
                      pageIndex != 1
                          ? Icon(
                              Icons.home,
                              size: 15,
                            )
                          : HeartbeatProgressIndicator(
                              child: Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                      Container(
                          width: 50,
                          color: Colors.white,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  value: pageIndex < 2 ? 0 : 1);
                            },
                          )),
                      pageIndex != 2
                          ? Icon(
                              Icons.home,
                              size: 15,
                            )
                          : HeartbeatProgressIndicator(
                              child: Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                      Container(
                          width: 50,
                          color: Colors.white,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  value: pageIndex < 3 ? 0 : 1);
                            },
                          )),
                      pageIndex != 3
                          ? Icon(
                              Icons.home,
                              size: 15,
                            )
                          : HeartbeatProgressIndicator(
                              child: Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                      Container(
                          width: 50,
                          color: Colors.white,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  value: pageIndex < 4 ? 0 : 1);
                            },
                          )),
                      pageIndex != 4
                          ? Icon(
                              Icons.home,
                              size: 15,
                            )
                          : HeartbeatProgressIndicator(
                              child: Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                      Container(
                          width: 50,
                          color: Colors.white,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  value: pageIndex < 5 ? 0 : 1);
                            },
                          )),
                      pageIndex != 5
                          ? Icon(
                              Icons.home,
                              size: 15,
                            )
                          : HeartbeatProgressIndicator(
                              child: Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                      Container(
                          width: 50,
                          color: Colors.white,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.0), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  value: pageIndex < 6 ? 0 : 1);
                            },
                          )),
                      pageIndex != 6
                          ? Icon(
                              Icons.home,
                              size: 15,
                            )
                          : HeartbeatProgressIndicator(
                              child: Icon(
                                Icons.home,
                                size: 15,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pageIndex++;
                        pageIndex == 6
                            ? print("devamke") //Ödeme sayfasına devam
                            : pageIndex;
                        print(pageIndex);
                      });
                    },
                    child: Text("git")),
              ),
            )
          ],
        ),
      )),
    );
  }
}
