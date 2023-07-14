import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Email"),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("password"),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 100,
              color: Colors.black,

              child: Center(child: Text("Sign in",style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: () async {
                String msg=await FireBaseHelper.base.anonymouslyGet();
                Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
                if(msg=="Succes")
                  {
                    Get.toNamed("/log");
                  }

              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.black,
                child: Center(child: Text("Guest",style: TextStyle(color: Colors.white),)),
              ),
            )
          ],
        ),
      )),
    ),);
  }
}
