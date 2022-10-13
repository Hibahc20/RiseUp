import 'dart:convert';
import 'dart:io';   // for File
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rise_up/lang/locale_keys.g.dart';
import '../Colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'AddresMapScreen.dart';

class BeneficiaryCompleteProfile extends StatefulWidget {
  const BeneficiaryCompleteProfile({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => StartState();
}
class StartState extends State<BeneficiaryCompleteProfile> {
  @override
  void initState() {
    super.initState();
    dateInput.text = ""; //set the initial value of text field
    getAllEducation();
  }
  // List of items in our dropdown menu
  var familyMembersNB = ['1','2','3','4','5','6','7','8','9','10'];
  String username = "",
      firstName = "",
      lastName = "",
      nickName = "",
      txtEmail = "",
      password = "",
      confirmPassword = "";
  String registrationNb = "",
      country = "",
      gender = "",
      maritalStatus = "",
      type = "",
      idNb = "",
      ngoName = "",
      ngoNB = "",
      occupation = "",
      monthlyIncome = "",
      educationLevel = "",
      location = "",
      streetAddress = "",
      building = "",
      apartment = "",
      dob = "",
      mobile = "",
      landline = "",
      familyMembers = "",
      familyBook = "";
  List countryItemList = [];
  var dropdownvalue;
  List genderItemList = [];
  var genderDropdownvalue;
  List maritalItemList = [];
  var maritalDropdownvalue;
  List typeItemList = [];
  var typeDropdownvalue;
  List educationItemList = [];
  var educationDropdownvalue;
  List occupationItemList = [];
  var occupationDropdownvalue;

  dynamic _pickImageError;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  File? _FrontIDimage;
  File? _BackIDimage;
  File? _FamilyBookImage;
  PickedFile? _pickedFileFrontIDimage;
  PickedFile? _pickedFileBackIDimage;
  PickedFile? _pickedFileFamilyBookImage;
  final _picker = ImagePicker();

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
                LocaleKeys.BeneficiaryCompleteProfile_lblTitle.tr(),
                style: const TextStyle(
                  fontFamily: "Lucida Sans",
                  color: blueTextColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                LocaleKeys.BeneficiaryCompleteProfile_lblSubTitle.tr(),
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
                            //Registry Number
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys
                                    .BeneficiaryCompleteProfile_lblRegistrationNb
                                    .tr(),
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must not be empty";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    registrationNb = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelText: 'Ex: 685987',
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
                            //CountryOfOrigin
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblCountry
                                    .tr(),
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
                              ),
                            ),
                            //gender and marital status
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
                                        ),
                                      ],
                                    )
                                ),
                                const SizedBox(
                                  width:10,
                                ),
                                //Marital Status
                                Flexible(
                                  flex:1,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(LocaleKeys
                                              .BeneficiaryCompleteProfile_lblStatus
                                              .tr(),
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
                                              'Select Status'
                                          ),
                                          items: maritalItemList.map((item) {
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
                                          value: maritalDropdownvalue,
                                          onChanged: (newVal) {
                                            setState(() {
                                              maritalDropdownvalue = newVal;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                            //Identification Type
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblType
                                    .tr(),
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
                                    'Select Status'
                                ),
                                items: typeItemList.map((item) {
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
                                value: typeDropdownvalue,
                                onChanged: (newVal) {
                                  setState(() {
                                    typeDropdownvalue = newVal;
                                  });
                                },
                              ),
                            ),
                            //Id Nb
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblIdNb
                                    .tr(),
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
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    idNb = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must not be empty";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: "Ex: 00 0000 00",
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
                            //Ikhraj kaid or Id
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblImageId
                                    .tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: greyInputColor,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          height: MediaQuery.of(context).size.height * 0.1,
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          child: _pickedFileFrontIDimage != null
                                              ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                8.0),
                                            child: Image.file(
                                              File(_pickedFileFrontIDimage!.path),
                                              fit: BoxFit.cover,
                                            ),
                                          ) : DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(15),
                                            color: greyTextColor,
                                            dashPattern: const [10, 6],
                                            strokeWidth: 1,
                                            child: const Center(
                                              child: Icon(
                                                Icons.add_circle_outline_outlined,
                                                color: greyTextColor,
                                              ),
                                            ),
                                          ),

                                        ),
                                        //onPressed: _openImagePicker,
                                        //onTap:()=> Get.find<ImageController>().pickImage(),
                                        onTap: () => _pickFrontImage(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Front Side",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Lucida Sans",
                                          color: redColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: greyInputColor,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          height: MediaQuery.of(context).size.height * 0.1,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.3,
                                          child: _pickedFileBackIDimage != null
                                              ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                8.0),
                                            child: Image.file(
                                              File(_pickedFileBackIDimage!.path),
                                              fit: BoxFit.cover,
                                            ),
                                          ) : DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(15),
                                            color: greyTextColor,
                                            dashPattern: const [10, 6],
                                            strokeWidth: 1,
                                            child: const Center(
                                              child: Icon(
                                                Icons.add_circle_outline_outlined,
                                                color: greyTextColor,
                                              ),
                                            ),
                                          ),

                                        ),
                                        //onPressed: _openImagePicker,
                                        //onTap:()=> Get.find<ImageController>().pickImage(),
                                        onTap: () => _pickBackImage(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Back Side",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Lucida Sans",
                                          color: redColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //NGO Name
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblNGOName
                                    .tr(),
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
                              child: TextFormField(
                                onChanged: (value) {
                                  ngoName = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must Not Be Empty";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: "Ex: abc",
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
                            //NGO Nb
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblNGONb
                                    .tr(),
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
                              child: TextFormField(
                                onChanged: (value) {
                                  ngoNB = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must Not Be Empty";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: "Ex: 12345678",
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
                            //Occupation
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblOccupation
                                  .tr(),
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
                                    'Select Status'
                                ),
                                items: occupationItemList.map((item) {
                                  return DropdownMenuItem(
                                    value: item['id'].toString(),
                                    child: Text(item['name'].toString()),
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
                                value: occupationDropdownvalue,
                                onChanged: (newVal) {
                                  setState(() {
                                    occupationDropdownvalue = newVal;
                                  });
                                },
                              ),
                            ),
                            //Monthly Income
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblMonthlyIncome
                                  .tr(),
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
                              child: TextFormField(
                                onChanged: (value) {
                                  monthlyIncome = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must Not Be Empty";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: "Ex: 3000USD",
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
                            //Educational level
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblEducationLevel
                                  .tr(),
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
                                    'Select Education'
                                ),
                                items: educationItemList.map((item) {
                                  return DropdownMenuItem(
                                    value: item['id'].toString(),
                                    child: Text(item['name'].toString()),
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
                                value: educationDropdownvalue,
                                onChanged: (newVal) {
                                  setState(() {
                                    educationDropdownvalue = newVal;
                                  });
                                },
                              ),
                            ),
                            //Location
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblLocation.tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            /** Change for map **/
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextFormField(
                                onChanged: (value) {
                                  location = value;
                                },
                                readOnly: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must Not Be Empty";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AddressMapScreen()),
                                  );
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  suffixIcon: Icon(Icons.my_location),
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: "Ex: Select your location",
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
                            //Street Address
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblStreetAddress
                                  .tr(),
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
                              child: TextFormField(
                                onChanged: (value) {
                                  streetAddress = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must Not Be Empty";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelStyle: TextStyle(
                                      fontFamily: "Open Sans"
                                  ),
                                  labelText: "Ex: 1903 strret 11",
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
                            // building and apartment
                            Row(
                              children: [
                                Flexible(
                                  flex:1,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(LocaleKeys
                                              .BeneficiaryCompleteProfile_lblBuilding
                                              .tr(),
                                            style: const TextStyle(
                                              fontFamily: "Lucida Sans",
                                              color: blueTextColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: TextFormField(
                                            onChanged: (value) {
                                              building = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Must Not Be Empty";
                                              }
                                              else {
                                                return null;
                                              }
                                            },
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                              fillColor: greyInputColor,
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontFamily: "Open Sans"
                                              ),
                                              labelText: "Ex: Sunset",
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
                                    )),
                                const SizedBox(
                                  width:10,
                                ),
                                //Apartment
                                Flexible(
                                  flex:1,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(LocaleKeys
                                              .BeneficiaryCompleteProfile_lblBuilding
                                              .tr(),
                                            style: const TextStyle(
                                              fontFamily: "Lucida Sans",
                                              color: blueTextColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: TextFormField(
                                            onChanged: (value) {
                                              building = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Must Not Be Empty";
                                              }
                                              else {
                                                return null;
                                              }
                                            },
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                              fillColor: greyInputColor,
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontFamily: "Open Sans"
                                              ),
                                              labelText: "Ex: Sunset",
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
                                    )
                                )
                              ],
                            ),
                            //Date of Birth
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblDOB
                                    .tr(),
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
                              child: TextFormField(
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
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  16-03-2012
                                    setState(() {
                                      dateInput.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                              ),
                            ),
                            //Mobile Nb
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.BeneficiaryCompleteProfile_lblMobile
                                    .tr(),
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
                                child: IntlPhoneField(
                                  decoration: const InputDecoration(
                                    fillColor: greyInputColor,
                                    filled: true,
                                    //icon of text field
                                    labelText: "Mobile Number",
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
                                  initialCountryCode: 'LB',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                )
                            ),
                            //Landline Nb
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblLandline.tr(),
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
                                child: IntlPhoneField(
                                  decoration: const InputDecoration(
                                    fillColor: greyInputColor,
                                    filled: true,
                                    //icon of text field
                                    labelText: "LandLine Number",
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
                                  initialCountryCode: 'LB',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                )
                            ),
                            //Family member nb
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblFamilyMemberNb
                                  .tr(),
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
                                // Initial Value
                                value: dropdownvalue,
                                hint: const Text(
                                    'Select Education'
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),// Down Arrow Icon
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
                                // Array list of items
                                items: familyMembersNB.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownvalue = newValue;
                                  });
                                },
                              ),
                            ),
                            //Family book
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .BeneficiaryCompleteProfile_lblFamilyBook
                                  .tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: Column(children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: greyInputColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: MediaQuery.of(context).size.height * 0.1,
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      child: _pickedFileFamilyBookImage != null
                                          ? ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            8.0),
                                        child: Image.file(
                                          File(_pickedFileFamilyBookImage!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ) : DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: const Radius.circular(15),
                                        color: greyTextColor,
                                        dashPattern: const [10, 6],
                                        strokeWidth: 1,
                                        child: const Center(
                                          child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: greyTextColor,
                                          ),
                                        ),
                                      ),

                                    ),
                                    //onPressed: _openImagePicker,
                                    //onTap:()=> Get.find<ImageController>().pickImage(),
                                    onTap: () => _pickFamilyBookImage(),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        );
                      }),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, MediaQuery
                .of(context)
                .size
                .height * 0.03, 0, MediaQuery
                .of(context)
                .size
                .height * 0.03),
            child: Center(
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
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
                      LocaleKeys.BeneficiaryCompleteProfile_btnNext.tr(),
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

  Future getAllEducation() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllEducation";
    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin education");
    if (response.body.isEmpty) {
      print("empty response");
    }
    if (response.body.isNotEmpty) {
      var jsonData = json.decode(response.body);
      setState(() {
        educationItemList = jsonData["data"];
      });
    }
  }

//correct it
  Future getAllMaritalStatus() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllMariedStatus";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = json.decode(response.body);
      setState(() {
        maritalItemList = jsonData;
      });
    }
    else
      print(response.statusCode);
  }

//correct it
  Future getAllTypes() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllMariedStatus";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = json.decode(response.body);
      setState(() {
        maritalItemList = jsonData;
      });
    }
    else
      print(response.statusCode);
  }

//correct it
  Future getAllOccupation() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllOccupation";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = json.decode(response.body);
      setState(() {
        occupationItemList = jsonData;
      });
    }
    else
      print(response.statusCode);
  }

// Implementing the image picker
  Future<void> _pickFrontImage() async {
    _pickedFileFrontIDimage =
    await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFileFrontIDimage != null) {
      setState(() {
        _FrontIDimage = File(_pickedFileFrontIDimage!.path);
      });
    }
  }

  Future<void> _pickBackImage() async {
    _pickedFileBackIDimage =
    await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFileBackIDimage != null) {
      setState(() {
        _BackIDimage = File(_pickedFileBackIDimage!.path);
      });
    }
  }

  Future<void> _pickFamilyBookImage() async {
    _pickedFileFamilyBookImage =
    await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFileFamilyBookImage != null) {
      setState(() {
        _FamilyBookImage = File(_pickedFileFamilyBookImage!.path);
      });
    }
  }
}