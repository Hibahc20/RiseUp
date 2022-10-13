import 'dart:convert';
import 'dart:io';   // for File
import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rise_up/lang/locale_keys.g.dart';
import '../BeneficiaryPages/AddresMapScreen.dart';
import '../Colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

class MerchantCompleteProfile extends StatefulWidget {
  const MerchantCompleteProfile({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => StartState();
}
class StartState extends State<MerchantCompleteProfile> {
  @override
  void initState() {
    super.initState();
    getAllTypes();
  }
  bool chkvalue=false;
  String username = "",
      firstName = "",
      lastName = "",
      nickName = "",
      txtEmail = "",
      password = "",
      confirmPassword = "";
  String storeName = "",
      personName = "",
      contactNb="",
      storenb="",location="",streetAddress="",registrationNb="",tradeNb="";
  List typeItemList = [];
  var typeDropdownvalue;

  dynamic _pickImageError;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? _FrontIDimage;
  File? _BackIDimage;
  File? _TradeImage;
  File? _registrationCopyImage;
  PickedFile? _pickedFileFrontIDimage;
  PickedFile? _pickedFileBackIDimage;
  PickedFile? _pickedFileTradeImage;
  PickedFile? _pickedFileregistrationCopyImage;
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
                LocaleKeys.MerchantCompleteProfile_lblTitle.tr(),
                style: const TextStyle(
                  fontFamily: "Lucida Sans",
                  color: blueTextColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                LocaleKeys.MerchantCompleteProfile_lblSubTitle.tr(),
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
                            //StoreName
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.MerchantCompleteProfile_lblStoreName.tr(),
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
                                    storeName = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelText: 'Ex: FreshMart',
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
                            //Person Name
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.MerchantCompleteProfile_lblPersonName
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
                                    personName = value;
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
                            //Store Nb
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.MerchantCompleteProfile_lblStorePhone
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
                                    labelText: "xx xxx xxx",
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
                                    storenb=phone.completeNumber;
                                  },
                                )
                            ),
                            //person Nb
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.MerchantCompleteProfile_lblContactNB
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
                                    labelText: "xx xxx xxx",
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
                                    contactNb=phone.completeNumber;
                                  },
                                )
                            ),
                            //Location
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(LocaleKeys
                                  .MerchantCompleteProfile_lblLocation.tr(),
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
                                  .MerchantCompleteProfile_lblStreetAddress
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
                            //Registry Number
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys
                                    .MerchantCompleteProfile_lblRegistrationNb
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
                                  labelText: 'Ex: 2020202020',
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
                            //Trade mark Number
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys
                                    .MerchantCompleteProfile_lblTrade
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
                                    tradeNb = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  fillColor: greyInputColor,
                                  filled: true,
                                  labelText: 'Ex: 12121213',
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
                            //Identification Type
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys
                                    .MerchantCompleteProfile_lblType
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
                              child: DropdownButtonFormField(
                                hint: const Text(
                                    'Select Identification'
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
                            //Ikhraj kaid or Id
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.MerchantCompleteProfile_lblImageId
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
                            //Trade License
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.MerchantCompleteProfile_lblImageLicense
                                    .tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,0,0),
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: greyInputColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: _pickedFileTradeImage != null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8.0),
                                      child: Image.file(
                                        File(_pickedFileTradeImage!.path),
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
                                  onTap: () => _pickTradeImage(),
                                ),
                              ),
                            ),
                            //Registration Copy
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.MerchantCompleteProfile_lblImageRegistration
                                    .tr(),
                                style: const TextStyle(
                                  fontFamily: "Lucida Sans",
                                  color: blueTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,0,0),
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: greyInputColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: _pickedFileregistrationCopyImage != null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8.0),
                                      child: Image.file(
                                        File(_pickedFileregistrationCopyImage!.path),
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
                                  onTap: () => _pickRegistrationImage(),
                                ),
                              ),
                            ),
                            //chechbox
                            Align(
                              alignment: Alignment.topLeft,
                              child: CheckboxListTileFormField(
                                title: Flexible(
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      text: LocaleKeys.MerchantCompleteProfile_ChkText1.tr(),
                                      style: const TextStyle(
                                          fontFamily: "Open Sans",
                                          fontSize: 15,
                                          color: greyTextColor,
                                          fontWeight: FontWeight.w400),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: LocaleKeys.MerchantCompleteProfile_chkText2.tr(),
                                          style: const TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 15,
                                              color: redColor,
                                              fontWeight: FontWeight.w600
                                          ),
                                          //recognizer: TapGestureRecognizer()..onTap = () =>Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckMailScreen()),)
                                        ),
                                        TextSpan(
                                          text: LocaleKeys.MerchantCompleteProfile_chkText3.tr(),
                                          style: const TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 15,
                                              color: greyTextColor,
                                              fontWeight: FontWeight.w400
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                checkColor: whiteColor,
                                // color of tick Mark
                                activeColor: redColor,
                                onChanged: (bool value) {
                                  setState(() {
                                    chkvalue = value;
                                  });
                                },
                                validator: (bool? value) {
                                  if (value!) {
                                    return null;
                                  } else {
                                    return 'Must be checked';
                                  }
                                },
                              ),
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
  Future getAllTypes() async {
    var baseUrl = "https://rise.anzimaty.com/api/General/GetAllMariedStatus";

    http.Response response = await http.post(Uri.parse(baseUrl));
    print("begin");
    print(response.body);
    var jsonData = json.decode(response.body);
    setState(() {
      typeItemList = jsonData["data"];
    });
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
  Future<void> _pickRegistrationImage() async {
    _pickedFileregistrationCopyImage =
    await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFileregistrationCopyImage != null) {
      setState(() {
        _registrationCopyImage = File(_pickedFileregistrationCopyImage!.path);
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

  Future<void> _pickTradeImage() async {
    _pickedFileTradeImage =
    await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFileTradeImage != null) {
      setState(() {
        _TradeImage = File(_pickedFileTradeImage!.path);
      });
    }
  }
}