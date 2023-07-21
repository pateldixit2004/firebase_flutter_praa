import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_pra/admin_update_screen.dart';
import 'package:firebase_flutter_pra/screen/view/home_screen.dart';
import 'package:firebase_flutter_pra/screen/view/logout_screen.dart';
import 'package:firebase_flutter_pra/screen/view/sibnup_regitor_screen.dart';
import 'package:firebase_flutter_pra/screen/view/splesh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) =>Selsh_Screen(),
        '/home':(p0) => HomeScreen(),
        '/signUp':(p0) => SignUpScreen(),
        '/log':(p0) => Log_Screen(),
        '/update':(p0) => AdminUpdateScreen(),
      },
    )
  );
}



