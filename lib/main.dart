import 'package:final_exam_online_shoping/modules/screens/Signup/view/signup.dart';
import 'package:final_exam_online_shoping/modules/screens/cart/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'modules/screens/detail/view/detail.dart';
import 'modules/screens/home/view/home.dart';
import 'modules/screens/login/view/login.dart';
import 'modules/screens/one_time_intro/view/one_time_intro.dart';
import 'modules/screens/splash/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(name: '/intro', page: () => intropage()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/signup', page: () => Signup()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/detail', page: () => Detail()),
        GetPage(name: '/cart', page: () => Cart()),
      ],
    ),
  );
}
