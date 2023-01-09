import 'package:flutter/material.dart';
import 'package:flutter_project/view/user/login_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupState();
}

class _SignupState extends State<SignupScreen> {
  late TextEditingController userIdController;
  late TextEditingController userPwController;
  late TextEditingController userPwChkController;
  late TextEditingController userNameController;
  late TextEditingController userPhoneController;
  late TextEditingController userEmailController;
  late TextEditingController userAddressController;

  late String userId; // for shortening
  late String userPw;
  late String userPwChk;
  late String userName;
  late String userPhone;
  late String userEmail;
  late String userAddress;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    userPwController = TextEditingController();
    userPwChkController = TextEditingController();
    userNameController = TextEditingController();
    userPhoneController = TextEditingController();
    userEmailController = TextEditingController();
    userAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    '       회원가입',
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 40, 50, 20),
                child: GestureDetector(
                  // on
                  child: TextField(
                    controller: userIdController,
                    decoration: const InputDecoration(hintText: '아이디'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  controller: userPwController,
                  decoration: const InputDecoration(hintText: '비밀번호'),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  controller: userPwChkController,
                  decoration: const InputDecoration(hintText: '비밀번호 확인'),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(hintText: '이름'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  controller: userPhoneController,
                  decoration: const InputDecoration(hintText: '전화번호'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  controller: userEmailController,
                  decoration: const InputDecoration(hintText: '이메일'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  controller: userAddressController,
                  decoration: const InputDecoration(hintText: '주소'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 100,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    userId = userIdController.text;
                    userPw = userPwController.text;
                    userPwChk = userPwChkController.text;
                    userName = userNameController.text;
                    userPhone = userPhoneController.text;
                    userEmail = userEmailController.text;
                    userAddress = userAddressController.text;
                    insertJSONData();
                  },
                  child: const Text(
                    '가입',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions
  // date: 2022.12.27
  // desc: insert input user data into db
  insertJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/streetCat_user_insert_flutter.jsp?userId=$userId&userPw=$userPw&userName=$userName&userEmail=$userEmail&userAddress=$userAddress&userPhone=$userPhone');
    await http.get(url);
    _showDialog(context);
  }

  // date: 2022.12.27
  // desc: insert complete msg
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('가입이 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
} // End
