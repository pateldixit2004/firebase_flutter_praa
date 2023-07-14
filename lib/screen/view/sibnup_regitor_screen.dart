import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                String msg=await FireBaseHelper.base.createUser(txtemail.text,txtpassword.text);
                if(msg=="Succes")
                {
                  Get.back();
                }
                Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );


              },


              child: Container(
                height: 50,
                width: 100,
                color: Colors.black,

                child: Center(child: Text("Sign up",style: TextStyle(color: Colors.white),)),
              ),
            ),
            SizedBox(height: 20,),

            TextButton(onPressed: () {


              Get.back();
            }, child: Text("Already have account"),),
          ],
        ),
      )),
    ),);
  }
}
