import 'package:flutter/material.dart';
import 'package:flutter_project/model/user/user_message.dart';
import 'package:flutter_project/view/user/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

// 회원 정보 수정 화면
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

    userIdController = TextEditingController(text: UserMessage.userId);
    userPwController = TextEditingController(text: UserMessage.userPw);
    userNameController = TextEditingController(text: UserMessage.userName);
    userPhoneController = TextEditingController(text: UserMessage.userPhone);
    userEmailController = TextEditingController(text: UserMessage.userEmail);
    userAddressController =
        TextEditingController(text: UserMessage.userAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2Z 헤이딜러'),
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
                    updateUserInfo();
                    _showUpdateDialog(context);
                  },
                  child: const Text('수정'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    userId = userIdController.text.trim();
                    deleteUserInfo();
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
  // desc: 유저 정보 수정
  updateUserInfo() async {
    var url = Uri.parse(// data transfer by get
        'http://localhost:8080/Flutter/usedcar_user_update_flutter.jsp?userId=$userId&userName=$userName&userEmail=$userEmail&userAddress=$userAddress&userPhone=$userPhone');
    await http.get(url);
    // ignore: use_build_context_synchronously
    _showUpdateDialog(context);
  }

  // date: 2022.12.22
  // desc: 수정 완료 메세지
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

  // date: 2023.01.11
  // desc: 탈퇴
  deleteUserInfo() async {
    var url = Uri.parse(// data transfer by get
        'http://localhost:8080/Flutter/usedcar_user_delete_flutter.jsp?userId=$userId');
    await http.get(url);
    // ignore: use_build_context_synchronously
    _showDeleteDialog(context);
  }

  // date: 2023.01.11
  // desc: 탈퇴 완료 메세지
  _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('탈퇴되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.to(() => const LoginScreen());
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
} // End
