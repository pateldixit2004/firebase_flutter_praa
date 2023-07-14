import 'package:flutter/material.dart';

class Log_Screen extends StatefulWidget {
  const Log_Screen({Key? key}) : super(key: key);

  @override
  State<Log_Screen> createState() => _Log_ScreenState();
}

class _Log_ScreenState extends State<Log_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Log Out"),
          onPressed: () {

          },
        ),
      ),
    ),);
  }
}
