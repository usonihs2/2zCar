import 'package:flutter/material.dart';

import 'package:flutter_project/view/user/login_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      // getPages: [
      //   GetPage(
      //     name: '/ForecastTabbar',
      //     page: () => const ForecastTabbar(),
      //   ),
      // ],
    );
  }
}
