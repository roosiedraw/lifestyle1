import 'package:flutter/material.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({super.key});

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final List<String> items = [
    'Couple',
    'Bull',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Merhaba,LifeStyle'a Hosgeldiniz",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          Text(
            "Sizi Daha Yakından Tanıyalım",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        ],
      ),
    );
  }
}
