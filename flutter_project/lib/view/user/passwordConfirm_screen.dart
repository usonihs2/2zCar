import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'myinfoUpdate_screen.dart';

// 회원정보 수정 전, 비밀번호 입력하여 본인 확인하는 화면
class PasswordConfirmScreen extends StatefulWidget {
  const PasswordConfirmScreen({super.key});

  @override
  State<PasswordConfirmScreen> createState() => _PasswordConfirmScreenState();
}

class _PasswordConfirmScreenState extends State<PasswordConfirmScreen> {
  late TextEditingController passwordCheckController;

  @override
  void initState() {
    super.initState();
    passwordCheckController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('본인 확인'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: passwordCheckController,
                decoration: const InputDecoration(hintText: '비밀번호'),
                obscureText: true,
              ),
            ),
            TextButton(
              onPressed: () {
                // 'test' 부분에 유저 비밀번호를 넣는다
                if (passwordCheckController.text.trim() == 'test') {
                  Get.to(() => const MyinfoUpdateScreen());
                } else {
                  _errorDialog(context);
                }
              },
              child: const Text('회원정보 수정'),
            ),
          ],
        ),
      ),
    );
  }

  // date: 2022.12.22
  // desc: 비밀번호 불일치 오류 메세지
  _errorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('비밀번호 불일치'),
            content: const Text('비밀번호를 확인해주세요 :)'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
} // End
