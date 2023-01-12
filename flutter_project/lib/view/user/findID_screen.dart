import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<FindIdScreen> createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
  late TextEditingController userPwController;
  late TextEditingController userNameController;
  late TextEditingController userEmailController;
  late String userPw;
  late String userName;
  late String userEmail;
  late List data;
  late String id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userPwController = TextEditingController();
    userNameController = TextEditingController();
    userEmailController = TextEditingController();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('아이디 찾기'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
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
                    controller: userPwController,
                    decoration: const InputDecoration(hintText: '비밀번호'),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                  child: TextField(
                    controller: userEmailController,
                    decoration: const InputDecoration(hintText: '이메일'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (userPwController.text.trim().isEmpty ||
                        userEmailController.text.trim().isEmpty ||
                        userNameController.text.trim().isEmpty) {
                      errorSnackbar(context);
                    } else {
                      userPw = userPwController.text;
                      userEmail = userEmailController.text;
                      userName = userNameController.text;
                      getJsonData1();
                    }
                  },
                  child: const Text('아이디 찾기'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //function===================================================================
  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('회원님의 정보를 입력해주세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  //아이디 삭제 확인
  getJsonData1() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/find_id_count.jsp?userPw=$userPw&userName=$userName&userEmail=$userEmail');
    var response = await http.get(url);
    data.clear();
    //중복 방지
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJson["results"];

    setState(() {
      data.addAll(result);
    });
    int i = int.parse(data[0]['count']);
    if (i == 1) {
      getJsonData();
    } else {
      _errorDialog(context);
    }
  }

  getJsonData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/find_id_flutter.jsp?userPw=$userPw&userName=$userName&userEmail=$userEmail');
    var response = await http.get(url);
    data.clear();
    //중복 방지
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJson["results"];

    setState(() {
      data.addAll(result);
    });
    id = data[0]['findID'];
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('${userNameController.text}님의 아이디는 "$id" 입니다.'),
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

  _errorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('삭제되었거나 없는 회원입니다.'),
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
}//end
