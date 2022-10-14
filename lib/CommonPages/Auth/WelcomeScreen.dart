import 'package:flutter/material.dart';
import 'package:rise_up/CommonPages/Auth/LoginScreen.dart';
import 'package:rise_up/BeneficiaryPages/BeneficiarySignUpToFillScreen.dart';
import 'package:rise_up/DonorPages/DonorLoginScreen.dart';
import '../../Colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../DonorPages/QuickSignInScreen.dart';
import '../../lang/locale_keys.g.dart';
import 'SignUpToFillScreen.dart';

class WelcomeScreen extends StatelessWidget {

  final String category;
  const WelcomeScreen({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: navyColor,
        appBar: AppBar(
          backgroundColor: navyColor,
          elevation: 0,
          leading: const BackButton(
              color: orangeColor// <-- SEE HERE
          ),
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
              child: Text(
                LocaleKeys.WelcomeScreen_lblTitle.tr(),
                style:const TextStyle(
                  fontFamily: "Lucida Sans",
                  color: whiteColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,// <-- SEE HERE
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width*0.9,
              child: Text(
                LocaleKeys.WelcomeScreen_txtContent1.tr(),
                textAlign: TextAlign.justify,
                style:const TextStyle(
                  fontFamily: "Lucida Sans",
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
            SizedBox(
              width:MediaQuery.of(context).size.width*0.9,
              child: Text(
                LocaleKeys.WelcomeScreen_txtContent2.tr(),
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
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,// <-- SEE HERE
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: TextButton(
                  onPressed: () {
                    if(category=='Beneficiary'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  BeneficiarySignUpToFillScreen()),
                      );
                    }
                    else if(category=="Donor"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  QuickSignInScreen(category: category)),
                      );
                    }
                    else if(category=="Merchant")
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpToFillScreen(category: category)),
                      );
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(orangeColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )
                      )
                  ),

                  child: Text(
                    LocaleKeys.WelcomeScreen_btnGetStarted.tr(),
                    style:const TextStyle(
                      color: Colors.white,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10, // <-- SEE HERE
            ),
            GestureDetector(
              onTap: (){
                if(category=='Beneficiary'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen(category: category)),
                  );
                }
                else if(category=="Donor"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DonorLoginScreen()),
                  );
                }
                else if(category=="Merchant")
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen(category: category)),
                  );
                }
              },
              child:  Text(
                LocaleKeys.WelcomeScreen_txtClickable.tr(),
                style:const TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 15,
                    color: whiteColor
                ),
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


