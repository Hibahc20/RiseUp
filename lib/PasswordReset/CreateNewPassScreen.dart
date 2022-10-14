import 'package:easy_localization/easy_localization.dart';
import '../lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../CommonPages/Auth/LoginScreen.dart';
import '../Colors.dart';

class CreateNewPassScreen extends StatelessWidget {
  final String category;

  const CreateNewPassScreen({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body:Column(
        children: [
          Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Assets/Images/CreatePassBanner.png"),
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
                              image: AssetImage("Assets/Images/LockPassIcon.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.35,0,0),
                  child:  ListTile(
                    title: Text(
                      LocaleKeys.CreateNewPassScreen_lblTitle.tr(),
                      style:const TextStyle(
                          fontFamily: "Lucida Sans",
                          color: blueTextColor,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          height: 1.1
                      ),
                    ),
                    subtitle: Text(
                      LocaleKeys.CreateNewPassScreen_lblSubTitle.tr(),
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
          Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child:ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          //password
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              LocaleKeys.CreateNewPassScreen_lblNewPass.tr(),
                              style:const TextStyle(
                                fontFamily: "Lucida Sans",
                                color: blueTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom:8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor:greyInputColor,
                                filled: true,
                                labelStyle: TextStyle(
                                    fontFamily: "Open Sans"
                                ),
                                labelText: 'Must be at least 8 characters',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)
                                    ),
                                    borderSide: BorderSide(
                                      color: greyInputColor,

                                    )
                                ),
                              ),
                            ),
                          ),
                          //confirm password
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              LocaleKeys.CreateNewPassScreen_lblConfirmPass.tr(),
                              style:const TextStyle(
                                fontFamily: "Lucida Sans",
                                color: blueTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom:8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor:greyInputColor,
                                filled: true,
                                labelStyle: TextStyle(
                                    fontFamily: "Open Sans"
                                ),
                                labelText: 'Both passwords must match',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)
                                    ),
                                    borderSide: BorderSide(
                                      color: greyInputColor,

                                    )
                                ),
                              ),
                            ),
                          ),

                        ],
                      );
                    }),
              )
          ),
          Padding(
            padding:EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
            child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(navyColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            elevation: 16,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*0.5,
                              width:MediaQuery.of(context).size.width*0.9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  <Widget>[
                                  const SizedBox(height: 20),
                                  Container(
                                    height:MediaQuery.of(context).size.width*0.3,
                                    width: MediaQuery.of(context).size.width*0.3,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("Assets/Images/ResetPassTrue.png"),
                                            fit: BoxFit.fill)),
                                  ),
                                  Center(
                                      child:
                                      Text(
                                          LocaleKeys.PassChangeDialog_lblTitle.tr(),
                                          style:const TextStyle(
                                            fontFamily: "Lucida Sans",
                                            color: navyColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ))
                                  ),
                                  Center(
                                      child:
                                      Text(
                                          LocaleKeys.PassChangeDialog_lblSubTitle.tr(),
                                          textAlign: TextAlign.center,
                                          style:const TextStyle(
                                            fontFamily: "Open Sans",
                                            color: greyTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ))
                                  ),
                                  Padding(
                                    padding:EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
                                    child: Center(
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          child: TextButton(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(navyColor),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    )
                                                )
                                            ),
                                            onPressed: () {
                                              //Navigator.push(
                                              // context,
                                              //  MaterialPageRoute(
                                              //      builder: (context) =>  const LoginScreen()),
                                              //);
                                            },
                                            child:  Text(
                                              LocaleKeys.PassChangeDialog_btnContinue.tr(),
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
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "RESET PASSWORD",
                      style: TextStyle(
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
        ],
      ),

    );
  }
}


