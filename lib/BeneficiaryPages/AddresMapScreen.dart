import 'dart:convert';

import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter/material.dart';
import 'package:rise_up/BeneficiaryPages/BeneficiaryCompleteProfile.dart';
import 'package:rise_up/lang/locale_keys.g.dart';
import '../Colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

class AddressMapScreen extends StatefulWidget {
  const AddressMapScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => StartState();
}
class StartState extends State<AddressMapScreen> {
  //TextController to read text entered in text field

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Text('Map')

    );
  }

}
