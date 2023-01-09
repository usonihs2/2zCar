import 'package:flutter/material.dart';
import 'package:flutter_project/view/forecast/brand_screen.dart';
import 'package:flutter_project/view/user/main_screen.dart';
import 'package:flutter_project/view/user/myinfoUpdate_screen.dart';
import 'package:get/get.dart';

import 'myforecastHistory_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yo'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MainScreen();
                    },
                  ),
                );
              },
              child: const Text('main'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BrandScreen();
                    },
                  ),
                );
              },
              child: const Text('forecast'),
            ),
            TextButton(
              onPressed: () {
                Get.to(const SignupScreen(),
                    transition: Transition.fadeIn,
                    duration: const Duration(seconds: 1));
              },
              child: const Text('회원가입'),
            ),
            TextButton(
              onPressed: () {
                Get.to(const MyinfoUpdateScreen(),
                    transition: Transition.upToDown,
                    duration: const Duration(seconds: 1));
              },
              child: const Text('회원정보 수정'),
            ),
            TextButton(
              onPressed: () {
                Get.to(const MyforecastHistoryScreen(),
                    transition: Transition.upToDown,
                    duration: const Duration(seconds: 1));
              },
              child: const Text('가격 예측 기록'),
            ),
          ],
        ),
      ),
    );
  }
}
