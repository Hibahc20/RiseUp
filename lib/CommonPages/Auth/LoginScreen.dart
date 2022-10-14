import 'dart:convert';
import 'package:flutter/material.dart';
import '../../lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rise_up/PasswordReset/ResetPasswordScreen.dart';
import '../../Colors.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  String category;

  LoginScreen({super.key, required this.category});
  @override
  State<StatefulWidget> createState() => StartState();
}
class StartState extends State<LoginScreen> {
  String username="",password="";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                          image: AssetImage("Assets/Images/SignUpBanner.png"),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery
                      .of(context)
                      .size
                      .width * 0.04, MediaQuery
                      .of(context)
                      .size
                      .width * 0.1, 0, 0),
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
                              image: AssetImage(
                                  "Assets/Images/Group 46912.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, MediaQuery
                      .of(context)
                      .size
                      .height * 0.35, 0, 0),
                  child: ListTile(
                    title: Text(
                      LocaleKeys.BeneficiarySignUpScreen_lblTitle.tr(),
                      style: const TextStyle(
                        fontFamily: "Lucida Sans",
                        color: blueTextColor,
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      LocaleKeys.BeneficiarySignUpScreen_lblSubTitle.tr(),
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
          Form(
            key: formKey,
            child: Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            //Email
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.LoginScreen_lblUserName.tr(),
                                style:const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                             Padding(
                              padding:const EdgeInsets.only(bottom:8.0),
                              child: TextFormField(
                                obscureText: true,
                                onChanged:(value){
                                  setState(() {
                                    username=value;
                                  });
                                },
                                decoration:const InputDecoration(
                                  fillColor:greyInputColor,
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: 'Ex: Lorem',
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
                            //password
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.LoginScreen_lblPass.tr(),
                                style:const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding:const EdgeInsets.only(bottom:8.0),
                              child: TextFormField(
                                obscureText: true,
                                onChanged:(value){
                                  setState(() {
                                    password=value;
                                  });
                                },
                                decoration:const InputDecoration(
                                  fillColor:greyInputColor,
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: 'Ex:********',
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
                            //forget password
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  ResetPasswordScreen(category : widget.category)),
                                );
                              },
                              child:  Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  LocaleKeys.LoginScreen_lblForgetPass.tr(),
                                  style:const TextStyle(
                                    fontFamily: "Lucida Sans",
                                    color: redColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.03, 0, MediaQuery.of(context).size.height * 0.03),
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
                    onPressed: () async {
                      //if the form is validated send api
                      if(formKey.currentState!.validate())
                      {
                        if(widget.category=="Beneficiary"){
                          //beneficiaryLogin
                          print(widget.category);
                          Map response= await BeneficiaryLogin(username,password);
                          if(response['success']==true){
                            //go to beneficiary profile page
                            print("success");
                          }
                          // else iza credentieals ghalat bado yraje3 error lezem
                          else print("Invalid Credentials");
                        }
                        else if(widget.category=="Donor"){
                          //donorLogin
                          print(widget.category);
                          Map response= await DonorLogin(username,password);
                          if(response['success']==true){
                            print("success");
                          }
                          else print("Invalid Credentials");
                        }
                        else if(widget.category=="Merchant"){
                          //merchantLogin
                          print(widget.category);
                          Map response= await MerchantLogin(username,password);
                          if(response['success']==true){
                            print("success");
                          }
                          else print("Invalid Credentials");
                        }
                      }
                      //else if not validated
                      else
                      {
                        print("UnSuccessfull");
                      }
                    },
                    child: Text(
                      LocaleKeys.BeneficiarySignUpScreen_btnSign.tr(),
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

Future<Map> BeneficiaryLogin(String userName, String password) async {
  var body = jsonEncode({
    'email_UserName': userName,
    'password': password,

  });
  print("begin");
  print("the username is $userName");
  var response =await http.post(
      Uri.parse('https://rise.anzimaty.com/api/Beneficiary/Login'),
      body: body,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
  Map result=json.decode(response.body);
  print(response.body);
  return result;
}
Future<Map> DonorLogin(String userName, String password) async {
  var body = jsonEncode({
    'email_UserName': userName,
    'password': password,

  });
  print("begin");
  print("the username is $userName");
  var response =await http.post(
      Uri.parse('https://rise.anzimaty.com/api/Donor/Login'),
      body: body,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
  Map result=json.decode(response.body);
  print(response.body);
  return result;
}
Future<Map> MerchantLogin(String userName, String password) async {
  var body = jsonEncode({
    'email_UserName': userName,
    'password': password,

  });
  print("begin");
  print("the username is $userName");
  var response =await http.post(
      Uri.parse('https://rise.anzimaty.com/api/Merchant/Login'),
      body: body,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
  Map result=json.decode(response.body);
  print(response.body);
  return result;
}