import 'dart:async';
import 'package:flutter/material.dart';
import 'LanguageScreen.dart';
import '../../Colors.dart';
void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const LanguageScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Container(

                  margin: const EdgeInsets.fromLTRB(0, 168, 0, 50),
                  child:Image.asset(
                      "Assets/Images/Logo.png",
                    width: 175,
                    height:200,
                  )
                ),
                Image.asset(
                    "Assets/Images/Vector.png",
                    alignment: Alignment.center,
                ),
                const Text(
                    "100% Secured App",
                  style: TextStyle(
                    fontFamily: "Lucida Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: greyTextColor,
                  ),
                )
              ]
            ),
          ),
          Positioned.fill(
            child: Image.asset(
            "Assets/Images/Frame.png",
            width: MediaQuery.of(context).size.width*1,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          )
        ],
      ),
    );
  }
}
