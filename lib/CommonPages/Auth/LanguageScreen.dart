import 'package:flutter/material.dart';
import '../../Colors.dart';
import 'VideoScreen.dart';
import 'package:easy_localization/easy_localization.dart';
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return  Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, MediaQuery.of(context).size.width*0.2, 0, 0),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                    "Language",
                  style: TextStyle(
                    fontFamily: "Lucida Sans",
                    color: blueTextColor,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  "Choose your preferred language",
                  style: TextStyle(
                    fontFamily: "Lucida Sans",
                    color: greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10, // <-- SEE HERE
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                  child: Image.asset("Assets/Images/united kingdom.png"),
                ),
                const SizedBox(
                  width: 10, // <-- SEE HERE
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(lightOrangeColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                      onPressed:() async{
                      await context.setLocale(const Locale('en'));
                      Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) => const VideoScreen()),
                       );
                    },
                      child: const Text(
                        "ENGLISH",
                        style: TextStyle(
                          color: blueTextColor,
                          fontFamily: "Lucida Sans",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),

                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10, // <-- SEE HERE
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                  child: Image.asset("Assets/Images/lebanon.png"),
                ),
                const SizedBox(
                  width: 10, // <-- SEE HERE
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(lightOrangeColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                        )
                    ),
                    onPressed:() async{
                      await context.setLocale(const Locale('ar'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VideoScreen()),
                      );
                    },
                    child: const Text(
                      "ARABIC",
                      style: TextStyle(
                        color: blueTextColor,
                        fontFamily: "Lucida Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),

                  ),
                )
              ],
            )
          ],
        ),
      )
      );

  }
  }