import 'package:flutter/material.dart';
import 'package:rise_up/PasswordReset/CheckMailScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import '../lang/locale_keys.g.dart';
import '../Colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String category;

  const ResetPasswordScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "Assets/Images/ResetPasswordBanner.png"),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.04, MediaQuery.of(context).size.width * 0.1, 0, 0),
                  child: GestureDetector(
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: orangeColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.04, MediaQuery.of(context).size.width * 0.57, MediaQuery.of(context).size.width * 0.1, 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/LockIcon.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.35, 0, 0),
                  child: ListTile(
                    title: Text(
                      LocaleKeys.ResetPasswordScreen_lblTitle.tr(),
                      style: const TextStyle(
                        fontFamily: "Lucida Sans",
                        color: blueTextColor,
                        fontSize: 34,
                        height: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      LocaleKeys.ResetPasswordScreen_lblSubTitle.tr(),
                      style: const TextStyle(
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
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          //Email to send to
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              LocaleKeys.ResetPasswordScreen_lblEmail.tr(),
                              style: const TextStyle(
                                fontFamily: "Lucida Sans",
                                color: blueTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 15.0),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: greyInputColor,
                                filled: true,
                                labelText: 'Ex: Lorem',
                                labelStyle: TextStyle(
                                    fontFamily: "Open Sans"
                                ),
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
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
            child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            navyColor),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  CheckMailScreen(category: category)),
                      );
                    },
                    child: Text(
                      LocaleKeys.ResetPasswordScreen_btnSendInstruct.tr(),
                      style: const TextStyle(
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
