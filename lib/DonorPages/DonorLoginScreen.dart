import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../lang/locale_keys.g.dart';
import '../CommonPages/Auth/LoginScreen.dart';
import '../Colors.dart';

class DonorLoginScreen extends StatefulWidget {
  const DonorLoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<DonorLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
  bool checkBoxValue = false;

  initWidget() {
    return  Scaffold(
      backgroundColor: bgColor,
      body:Column(
        children: [
          Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Assets/Images/loginBanner.png"),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, MediaQuery.of(context).size.width*0.1, 0, 0),
                  child: GestureDetector(
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: orangeColor,
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, MediaQuery.of(context).size.width*0.57, MediaQuery.of(context).size.width*0.1, 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height:MediaQuery.of(context).size.width*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/userIcon.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.35,0,0),
                  child:  ListTile(
                    title: Text(
                      LocaleKeys.DonorLoginScreen_lblTitle.tr(),
                      style:const TextStyle(
                        fontFamily: "Lucida Sans",
                        color: blueTextColor,
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      LocaleKeys.DonorLoginScreen_lblSubTitle.tr(),
                      style:const TextStyle(
                        fontFamily: "Open Sans",
                        color: greyTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ]
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
            LocaleKeys.DonorLoginScreen_lblOR.tr(),
            style:const TextStyle(
              color: greyTextColor,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.05,0,MediaQuery.of(context).size.width*0.05),
            child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(lightOrangeColor),
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
                            builder: (context) =>  LoginScreen(category: 'Donor')),
                      );
                    },
                    child: Text(
                      LocaleKeys.DonorLoginScreen_btnLogin.tr(),
                      style:const TextStyle(
                        color: navyColor,
                        fontFamily: "Lucida Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),

    );
  }

}
