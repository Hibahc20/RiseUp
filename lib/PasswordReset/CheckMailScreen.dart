import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rise_up/PasswordReset/CreateNewPassScreen.dart';
import 'package:rise_up/PasswordReset/ResetPasswordScreen.dart';
import '../CommonPages/Auth/LoginScreen.dart';
import '../Colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../lang/locale_keys.g.dart';

class CheckMailScreen extends StatelessWidget {
  final String category;

  const CheckMailScreen({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navyColor,
      body:  Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
            child: SizedBox(
              height:MediaQuery.of(context).size.height*0.7,
              child: Column(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.width*0.4,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Assets/Images/EmailIcon.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,// <-- SEE HERE
                  ),
                  SizedBox(
                    child:Text(
                      LocaleKeys.CheckMailScreen_lblTitle.tr(),
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
                      LocaleKeys.CheckMailScreen_lblSubTitle.tr(),
                      textAlign: TextAlign.center,
                      style:const TextStyle(
                        fontFamily: "Open Sans",
                        color: whiteColor,
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,// <-- SEE HERE
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  CreateNewPassScreen(category: category)),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(orangeColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )
                            )
                        ),

                        child:  Text(
                          LocaleKeys.CheckMailScreen_btnOpenMail.tr(),
                          style:const TextStyle(
                            color: whiteColor,
                            fontFamily: "Open Sans",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,// <-- SEE HERE
                  ),
                  GestureDetector(
                    onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  LoginScreen(category: category,)),
                       );
                    },
                    child:  Text(
                      LocaleKeys.CheckMailScreen_txtClickableSkip.tr(),
                      style:const TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 15,
                          color: orangeColor,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10, // <-- SEE HERE
                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ResetPasswordScreen(category: category,)),
                );
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,

                  child: RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                      text: LocaleKeys.CheckMailScreen_lblFooterNote1.tr(),

                      style: const TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 15,
                          color: whiteColor,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: LocaleKeys.CheckMailScreen_lblFooterNote2.tr(),
                            style:const TextStyle(
                                fontFamily: "Open Sans",
                                fontSize: 15,
                                color: orangeColor,
                                fontWeight: FontWeight.w400
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () =>Navigator.push(context, MaterialPageRoute(builder: (context) =>  CheckMailScreen(category: category,)),)

                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ],

      ),

    );
  }

}
