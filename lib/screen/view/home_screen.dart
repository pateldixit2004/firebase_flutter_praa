import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

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
      body: Center(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Image.asset('assets/image/su1.png'),

              Text("Sign In",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              TextField(
                controller: txtemail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    label: const Text("Email"),
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: txtpassword,
                obscureText: true,

                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),

                  label: const Text("Password"),
                  labelStyle: TextStyle(color: Colors.black),

                ),
              ),
              SizedBox(height: 15,),
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
                  height: 6.5.h,
                  width: 95.h,
                  decoration: BoxDecoration(
                    // color: Color(0xff9F57F9),
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30.sp)
                  ),
                  child: Center(child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                )
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      String msg=await FireBaseHelper.base.anonymouslyGet();
                      Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
                      if(msg=="Succes")
                      {
                        Get.toNamed("/log");
                      }
                      Get.snackbar('$msg','',backgroundColor: msg=="Sucess"?Colors.green:Colors.red );

                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage('assets/image/img.png',),fit: BoxFit.fill),
                      ),
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
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage('assets/image/img_1.png',),fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //       onTap: () async {
              //         String msg=await FireBaseHelper.base.anonymouslyGet();
              //         Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
              //         if(msg=="Succes")
              //         {
              //           Get.toNamed("/log");
              //         }
              //
              //       },
              //       child: Container(
              //         height: 50,
              //         width: 70,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.black,
              //
              //         ),
              //         child: Center(child: Text("Guest",style: TextStyle(color: Colors.white),)),
              //       ),
              //     ),
              //
              //     InkWell(
              //       onTap: () async {
              //         String msg=await FireBaseHelper.base.googleSignIn();
              //         Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
              //         if(msg=="Succes")
              //         {
              //           Get.toNamed("/log");
              //         }
              //
              //       },
              //       child: Container(
              //         height: 50,
              //         width: 70,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.black,
              //
              //         ),
              //         child: Center(child: Text("Google",style: TextStyle(color: Colors.white),)),
              //       ),
              //     ),
              //
              //   ],
              // ),

              /**/
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
              SizedBox(height: 5.h,),
              TextButton(onPressed: () {

                Get.toNamed('/signUp');


              }, child: Text("Create a account! sign up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),),

              // TextButton(onPressed: () {
              //   Get.toNamed('/signUp');
              //
              // }, child: Text("Create a account! sign up"),),
            ],
          ),
        ),
      )),
    ),);
  }
}
