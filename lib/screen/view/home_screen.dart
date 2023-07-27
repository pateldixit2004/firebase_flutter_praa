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
  TextEditingController txtemail=TextEditingController();
  TextEditingController txtpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            SizedBox(height: 200,),
            TextField(
              controller: txtemail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Email"),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: txtpassword,
              obscureText: true,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("password"),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(

              onTap: () async {
                String msg=await FireBaseHelper.base.signin(txtemail.text, txtpassword.text);
                if(msg=="Succes")
                  {
                    Get.offAllNamed("/log");
                  }
                Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );

              },

              child: Container(
                height: 50,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Center(child: Text("Sign in",style: TextStyle(color: Colors.white),)),
              ),
            ),
            SizedBox(height: 20,),

            // InkWell(
            //   onTap: () async {
            //     String msg=await FireBaseHelper.base.anonymouslyGet();
            //     Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
            //     if(msg=="Succes")
            //       {
            //         Get.toNamed("/log");
            //       }
            //
            //   },
            //   child: Container(
            //     height: 50,
            //     width: 100,
            //     color: Colors.black,
            //     child: Center(child: Text("Guest",style: TextStyle(color: Colors.white),)),
            //   ),
            // ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,

                    ),
                    child: Center(child: Text("Guest",style: TextStyle(color: Colors.white),)),
                  ),
                ),

                InkWell(
                  onTap: () async {
                    String msg=await FireBaseHelper.base.googleSignIn();
                    Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
                    if(msg=="Succes")
                    {
                      Get.toNamed("/log");
                    }

                  },
                  child: Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,

                    ),
                    child: Center(child: Text("Google",style: TextStyle(color: Colors.white),)),
                  ),
                ),

              ],
            ),
            // InkWell(
            //   onTap: () async {
            //     String msg=await FireBaseHelper.base.googleSignIn();
            //     Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
            //     if(msg=="Succes")
            //       {
            //         Get.toNamed("/log");
            //       }
            //
            //   },
            //   child: Container(
            //     height: 50,
            //     width: 100,
            //     color: Colors.black,
            //     child: Center(child: Text("Google",style: TextStyle(color: Colors.white),)),
            //   ),
            // ),
            Spacer(),
            TextButton(onPressed: () {
              Get.toNamed('/signUp');

            }, child: Text("Create a account! sign up"),),
          ],
        ),
      )),
    ),);
  }
}
