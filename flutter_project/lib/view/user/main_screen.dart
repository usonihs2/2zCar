import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/view/user/login_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List imagesFile; //광고 이미지 파일 배열
  late int currentPage; //현재 페이지 순서
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagesFile = [
      '광고1.png',
      '광고2.jpg',
      '광고3.png',
    ];
    currentPage = 0;

    //timer설치
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _timer.cancel();
              Get.off(
                const LoginScreen(),
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Text(
                      'AD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(
                  children: [
                    // Text(
                    //   imagesFile[currentPage],
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 20,
                    //   ),
                    // ),
                    Image.asset(
                      'images/${imagesFile[currentPage]}',
                      width: 500,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ElevatedButton(
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(380, 40),
                  ),
                  child: const Text(
                    '내 차 가격예측',
                  ),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      '최근 예측 기록',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //function===================================================================
  changeImage() {
    setState(() {
      currentPage++;
      if (currentPage >= imagesFile.length) {
        currentPage = 0;
      }
    });
  }
}//end
