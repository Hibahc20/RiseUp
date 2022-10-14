import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rise_up/CommonPages/Auth/SignUpToFillScreen.dart';
import '../lang/locale_keys.g.dart';
import '../Colors.dart';
class QuickSignInScreen extends StatefulWidget {
  final String category;
  const QuickSignInScreen({super.key, required this.category});

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<QuickSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return  Scaffold(
      backgroundColor: navyColor,
      appBar: AppBar(
        backgroundColor: navyColor,
        elevation: 0,
        leading: const BackButton(
            color: orangeColor// <-- SEE HERE
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
            child: Text(
              LocaleKeys.DonorQuickSignIn_lblTitle.tr(),
              style:const TextStyle(
                fontFamily: "Lucida Sans",
                color: whiteColor,
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width:MediaQuery.of(context).size.width*0.9,
            child: Text(
              LocaleKeys.DonorQuickSignIn_lblSubTitle.tr(),
              textAlign: TextAlign.justify,
              style:const TextStyle(
                fontFamily: "Open Sans",
                color: whiteColor,
                fontSize: 18,
                height: 1.2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.05,0,MediaQuery.of(context).size.width*0.05),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      height:MediaQuery.of(context).size.width*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/Sign Up with Facebook.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height:MediaQuery.of(context).size.width*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/Sign Up with Google.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height:MediaQuery.of(context).size.width*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/Sign Up with Twitter.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height:MediaQuery.of(context).size.width*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/Sign Up with Yahoo.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ],
              ),
            ),
          ),
           Text(
            LocaleKeys.DonorQuickSignIn_lblOR.tr(),
            style:const TextStyle(
              color: whiteColor,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.03,0,MediaQuery.of(context).size.width*0.03),
            child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(orangeColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SignUpToFillScreen(category: 'Donor')),
                      );
                    },
                    child:  Text(
                      LocaleKeys.DonorQuickSignIn_btnCreate.tr(),
                      style:const TextStyle(
                        color: whiteColor,
                        fontFamily: "Lucida Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              "Assets/Images/WelcomeImage/Frame2.png",
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