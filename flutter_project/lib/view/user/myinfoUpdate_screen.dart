import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MyinfoUpdateScreen extends StatefulWidget {
  const MyinfoUpdateScreen({super.key});

  @override
  State<MyinfoUpdateScreen> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyinfoUpdateScreen> {
  late TextEditingController userIdController;
  late TextEditingController userPwController;
  late TextEditingController userNameController;
  late TextEditingController userPhoneController;
  late TextEditingController userEmailController;
  late TextEditingController userAddressController;

  late String userId; // for shortening
  late String userPw;
  late String userName;
  late String userPhone;
  late String userEmail;
  late String userAddress;

  late List data;

  @override
  void initState() {
    super.initState();

    // userIdController = TextEditingController(text: Message.userId);
    // userPwController = TextEditingController(text: Message.userPw);
    // userNameController = TextEditingController(text: Message.userName);
    // userPhoneController = TextEditingController(text: Message.userPhone);
    // userEmailController = TextEditingController(text: Message.userEmail);
    // userAddressController = TextEditingController(text: Message.userAddress);
    userIdController = TextEditingController();
    userPwController = TextEditingController();
    userNameController = TextEditingController();
    userPhoneController = TextEditingController();
    userEmailController = TextEditingController();
    userAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2Z 헤이딜러'),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              '내 정보',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 40, 50, 20),
              child: GestureDetector(
                // on
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(hintText: '아이디'),
                  readOnly: true,
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    userId = userIdController.text.trim();
                    userName = userNameController.text.trim();
                    userPhone = userPhoneController.text.trim();
                    userEmail = userEmailController.text.trim();
                    userAddress = userAddressController.text.trim();
                    // updateUserInfo();
                    _showUpdateDialog(context);
                  },
                  child: const Text('수정'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //
                  },
                  child: const Text('탈퇴'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- functions
  // date: 2022.12.29
  // desc: update user info
  updateUserInfo() async {
    var url = Uri.parse(// data transfer by get
        'http://localhost:8080/Flutter/streetCat_user_update_flutter.jsp?userId=$userId&userName=$userName&userEmail=$userEmail&userAddress=$userAddress&userPhone=$userPhone');
    await http.get(url);
    _showUpdateDialog(context);
  }

  // date: 2022.12.22
  // desc: update complete msg
  _showUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('수정 결과'),
            content: const Text('수정이 완료 되었습니다.'),
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
