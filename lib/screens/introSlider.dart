import 'package:introduction_slider/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';
import 'package:lifestyle/screens/login.dart';
import 'package:lifestyle/screens/register/register.dart';
import 'package:lifestyle/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class introSlider extends StatefulWidget {
  const introSlider({super.key});

  @override
  State<introSlider> createState() => _introSliderState();
}

class _introSliderState extends State<introSlider> {
  void onDonePress() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
          subtitle: Text(
            textAlign: TextAlign.center,
            "grfnbsrojgnrdpgnr nngdnrgdn lgndr nogbdrdngnmd ngldrnpgrgol jndpndlon grğ",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          logo: FlutterLogo(),
          backgroundColor: Color.fromARGB(255, 248, 153, 209),
          title: Text(
            AppLocalizations.of(context)!.intro1Title,
            style: TextStyle(fontSize: 30, color: mainThemeColor),
          ),
        ),
        IntroductionSliderItem(
          subtitle: Text(
            textAlign: TextAlign.center,
            "grfnbsrojgnrdpgnr nngdnrgdn lgndr nogbdrdngnmd ngldrnpgrgol jndpndlon grğ",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          logo: FlutterLogo(),
          backgroundColor: Color.fromARGB(255, 253, 126, 200),
          title: Text(
            AppLocalizations.of(context)!.intro2Title,
            style: TextStyle(fontSize: 30, color: mainThemeColor),
          ),
        ),
        IntroductionSliderItem(
          subtitle: Text(
            textAlign: TextAlign.center,
            "grfnbsrojgnrdpgnr nngdnrgdn lgndr nogbdrdngnmd ngldrnpgrgol jndpndlon grğ",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          logo: FlutterLogo(),
          backgroundColor: Color.fromARGB(255, 255, 69, 184),
          title: Text(
            AppLocalizations.of(context)!.intro3Title,
            style: TextStyle(fontSize: 30, color: mainThemeColor),
          ),
        ),
      ],
      done: Done(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: Size(70, 40)),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: (Text("Sign Up"))),
        home: Register(),
      ),
      next: Next(child: Icon(Icons.arrow_forward)),
      back: Back(child: Icon(Icons.arrow_back)),
      dotIndicator: DotIndicator(
          selectedColor: mainThemeColor, unselectedColor: Colors.grey),
    );
  }
}
