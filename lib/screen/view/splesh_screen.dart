import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Selsh_Screen extends StatefulWidget {
  const Selsh_Screen({Key? key}) : super(key: key);

  @override
  State<Selsh_Screen> createState() => _Selsh_ScreenState();
}

class _Selsh_ScreenState extends State<Selsh_Screen> {

  bool islogin=false;

  @override
  void initState() {
    super.initState();

    FireBaseHelper.base.chechUser();
    Timer(Duration(seconds: 5), () {
      islogin==true?Get.toNamed("/home"):Get.toNamed("/log");

    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    ),);
  }
}