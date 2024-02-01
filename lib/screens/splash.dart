import 'package:flutter/material.dart';
import 'package:lifestyle/screens/login.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    splashWaiting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Icon(Icons.heart_broken),
        ),
      ),
    );
  }

  Future<void> splashWaiting() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );

    ;
  }
}
