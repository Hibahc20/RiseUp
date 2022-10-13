import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rise_up/lang/locale_keys.g.dart';
import '../Colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

class DonorCompleteProfile extends StatefulWidget {
  const DonorCompleteProfile({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => StartState();
}
class StartState extends State<DonorCompleteProfile> {
  @override
  void initState() {
    super.initState();
    dateInput.text = ""; //set the initial value of text field
    getAllNationality();
    getAllCountries();
    getAllGenders();

  }
  String username = "", firstName = "", lastName = "", nickName = "", txtEmail = "", password = "", confirmPassword = "";
  List countryItemList = [];
  var dropdownvalue;
  List genderItemList = [];
  var genderDropdownvalue;
  List nationalityItemList = [];
  var nationalityDropdownvalue;
  List interestItemList = [];
  var iterestDropdownvalue;


  dynamic _pickImageError;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const BackButton(
            color: orangeColor // <-- SEE HERE
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, MediaQuery
                .of(context)
                .size
                .height * 0.01, 0, 10),
            child: ListTile(
              title: Text(
                LocaleKeys.DonorCompleteProfile_lblTitle.tr(),
                style: const TextStyle(
                  fontFamily: "Lucida Sans",
                  color: blueTextColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                LocaleKeys.DonorCompleteProfile_lblSubTitle.tr(),
                style: const TextStyle(
                  fontFamily: "Open Sans",
                  color: greyTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
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
                            //First Name
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.DonorCompleteProfile_lblFname.tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    firstName = value;
                                  });
                                },
                                decoration: const InputDecoration(
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
                            //LastName
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.DonorCompleteProfile_lblLname.tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    lastName = value;
                                  });
                                },
                                decoration: const InputDecoration(
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
                            //Nick Name
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.DonorCompleteProfile_lblNickName.tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    nickName = value;
                                  });
                                },
                                decoration: const InputDecoration(
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
                            //gender and DOB
                            Row(
                              children: [
                                //Gender
                                Flexible(
                                    flex:1,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            LocaleKeys.BeneficiaryCompleteProfile_lblGender.tr(),
                                            style: const TextStyle(
                                              fontFamily: "Lucida Sans",
                                              color: blueTextColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        DropdownButtonFormField(
                                          hint: const Text(
                                              'Select Gender'
                                          ),
                                          items: genderItemList.map((item) {
                                            return DropdownMenuItem(
                                              value: item['ClassCode']
                                                  .toString(),
                                              child: Text(
                                                  item['ClassName'].toString()),
                                            );
                                          }).toList(),
                                          decoration: const InputDecoration(
                                            fillColor: greyInputColor,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)
                                                ),
                                                borderSide: BorderSide(
                                                  color: greyInputColor,

                                                )
                                            ),

                                          ),
                                          value: genderDropdownvalue,
                                          onChanged: (newVal) {
                                            setState(() {
                                              genderDropdownvalue = newVal;
                                            });
                                          },
                                          validator:(value) {
                                            if (value == null) {
                                              return "Must Choose Gender";
                                            }
                                            else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ],
                                    )
                                ),
                                const SizedBox(
                                  width:10,
                                ),
                                //Date of Birth
                                Flexible(
                                    flex:1,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(LocaleKeys.DonorCompleteProfile_lblDOB.tr(),
                                            style: const TextStyle(
                                              fontFamily: "Lucida Sans",
                                              color: blueTextColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          controller: dateInput,
                                          //editing controller of this TextField
                                          decoration: const InputDecoration(
                                            fillColor: greyInputColor,
                                            filled: true,
                                            suffixIcon: Icon(Icons.calendar_today),
                                            //icon of text field
                                            labelText: "Enter Date",
                                            //label text of field
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)
                                                ),
                                                borderSide: BorderSide(
                                                  color: greyInputColor,

                                                )
                                            ),
                                          ),
                                          readOnly: true,
                                          validator:(value) {
                                            if (value == null) {
                                              return "Must Choose Date";
                                            }
                                            else {
                                              return null;
                                            }
                                          },
                                          //set it true, so that user will not able to edit text
                                          onTap: () async {
                                            DateTime? pickedDate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2100));

                                            if (pickedDate != null) {
                                              print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                              print(
                                                  formattedDate); //formatted date output using intl package =>  16-03-2012
                                              setState(() {
                                                dateInput.text =
                                                    formattedDate; //set output date to TextField value.
                                              });
                                            } else {}
                                          },
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                            //Country Origin
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.DonorCompleteProfile_lblCountry.tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: DropdownButtonFormField(
                                hint: const Text(
                                    'Select Country'
                                ),
                                items: countryItemList.map((item) {
                                  return DropdownMenuItem(
                                    value: item['ClassCode'].toString(),
                                    child: Text(item['ClassName'].toString()),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)
                                      ),
                                      borderSide: BorderSide(
                                        color: greyInputColor,

                                      )
                                  ),

                                ),
                                value: dropdownvalue,
                                onChanged: (newVal) {
                                  setState(() {
                                    dropdownvalue = newVal;
                                  });
                                },
                                validator:(value) {
                                  if (value == null) {
                                    return "Must Choose Country";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            //nationality and iterest
                            Row(
                              children: [
                                Flexible(
                                    flex:1,
                                    child: Column(
                                      children: [
                                        //Nationality Origin
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            LocaleKeys.DonorCompleteProfile_lblNationality.tr(),
                                            style: const TextStyle(
                                              fontFamily: "Lucida Sans",
                                              color: blueTextColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        DropdownButtonFormField(
                                          hint:  Text(
                                              'Select Nationality',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.height*0.019
                                            ),
                                          ),
                                          items: nationalityItemList.map((item) {
                                            return DropdownMenuItem(
                                              value: item['ClassCode'].toString(),
                                              child: Text(item['ClassName'].toString()),
                                            );
                                          }).toList(),
                                          decoration: const InputDecoration(
                                            fillColor: greyInputColor,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)
                                                ),
                                                borderSide: BorderSide(
                                                  color: greyInputColor,

                                                )
                                            ),

                                          ),
                                          value: nationalityDropdownvalue,
                                          onChanged: (newVal) {
                                            setState(() {
                                              nationalityDropdownvalue = newVal;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                ),
                                const SizedBox(
                                  width:10,
                                ),
                                //Date of Birth
                                Flexible(
                                    flex:1,
                                    child: Column(
                                      children: [
                                        //Interest Origin
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            LocaleKeys.DonorCompleteProfile_lblInterest.tr(),
                                            style: const TextStyle(
                                              fontFamily: "Lucida Sans",
                                              color: blueTextColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        DropdownButtonFormField(
                                          hint:  Text(
                                              'Select Interest',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.019
                                            ),
                                          ),
                                          items: interestItemList.map((item) {
                                            return DropdownMenuItem(
                                              value: item['ClassCode'].toString(),
                                              child: Text(item['ClassName'].toString()),
                                            );
                                          }).toList(),
                                          decoration: const InputDecoration(
                                            fillColor: greyInputColor,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)
                                                ),
                                                borderSide: BorderSide(
                                                  color: greyInputColor,

                                                )
                                            ),

                                          ),
                                          value: iterestDropdownvalue,
                                          onChanged: (newVal) {
                                            setState(() {
                                              iterestDropdownvalue = newVal;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),

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
                      if (formKey.currentState!.validate()) {
                        /**bool chk2=true;
                            bool chk1=true;
                            Map response= await BeneficiaryRegister(username,firstName,lastName,nickName,txtEmail,password,chk1,chk2);
                            if(response['success']==true){
                            print("succes");
                            }
                            else print("user already exist");**/
                      }
                      //else if not validated
                      else {
                        print("UnSuccessfull");
                      }
                    },
                    child: Text(
                      LocaleKeys.DonorCompleteProfile_btnFinish.tr(),
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

//correct it
  Future getAllCountries() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllCountry";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    print(response.body);
    var jsonData = json.decode(response.body);
    setState(() {
      countryItemList = jsonData;
    });

  }

//correct it
  Future getAllGenders() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllGender";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = json.decode(response.body);
      setState(() {
        genderItemList = jsonData;
      });
    }
    else
      print(response.statusCode);
  }
  //correct it
  Future getAllNationality() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllNationality";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = json.decode(response.body);
      setState(() {
        nationalityItemList = jsonData;
      });
    }
    else
      print(response.statusCode);
  }
  Future getAllInterest() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllDontationOfInterestType";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = json.decode(response.body);
      setState(() {
        interestItemList = jsonData;
      });
    }
    else
      print(response.statusCode);
  }
}