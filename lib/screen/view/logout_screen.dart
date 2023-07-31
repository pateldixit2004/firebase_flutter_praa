import 'package:firebase_flutter_pra/screen/controller/user_controller.dart';
import 'package:firebase_flutter_pra/screen/view/product_add_screen.dart';
import 'package:firebase_flutter_pra/screen/view/product_screen.dart';
import 'package:firebase_flutter_pra/utils/firebase_helper.dart';
import 'package:firebase_flutter_pra/utils/local_notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Log_Screen extends StatefulWidget {
  const Log_Screen({Key? key}) : super(key: key);

  @override
  State<Log_Screen> createState() => _Log_ScreenState();
}

class _Log_ScreenState extends State<Log_Screen> {
  UserControler controler = Get.put(UserControler());

  @override
  void initState() {
    super.initState();
    controler.userMap.value = FireBaseHelper.base.userData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(

        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            actions: [
              IconButton(onPressed: () {
                Notifactionhelper.notification.showSimpleNotifiction();
              }, icon: Icon(Icons.notification_add_outlined)),
              IconButton(onPressed: () {
                Notifactionhelper.notification.timerNoti();
              }, icon: Icon(Icons.timer))
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text("Product"),
                ),
                Tab(
                  child: Text("Add"),
                )
              ],

            ),
          ),
          body: TabBarView(
            children: [
              ProductScreen(),
              AddProuctScreen(),
            ],
          ),
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(controler.userMap['photo'] == null
                        ? "https://cdn-icons-png.flaticon.com/128/4140/4140048.png"
                        : "${controler.userMap["photo"]}"),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  Text(controler.userMap['name'] == null
                      ? ""
                      : "${controler.userMap['name']}"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(controler.userMap['email'] == null
                      ? ""
                      : "${controler.userMap['email']}"),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: Text("Log Out"),
                    onPressed: () {
                      FireBaseHelper.base.SignOut();
                      Get.offAllNamed('/home');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
