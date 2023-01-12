import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/view/forecast/forecast_tabbar.dart';
import 'package:flutter_project/view/user/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  late List imagesFile; //광고 이미지 파일 배열
  late int currentPage; //현재 페이지 순서
  late Timer _timer;
  var value = Get.arguments ?? '_';
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    imagesFile = [
      '광고1.png',
      '광고2.jpg',
      '광고3.png',
    ];
    currentPage = 0;

    //timer설치
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (mounted) {
        changeImage();
      }
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
              value == false ? _disposeSaharedPreferences() : null;
              // _disposeSaharedPreferences();
              Get.offAll(
                const LoginScreen(),
              );
            },
            icon: const Icon(
              Icons.logout_sharp,
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
                    _timer.cancel();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForecastTabbar(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(380, 40),
                  ),
                  child: const Text(
                    '내 차 가격예측하기',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  data.isEmpty
                      ? const Text('데이터가 없습니다.')
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          fit: BoxFit.fill,
                                          'images/${data[index]['postImage']}.jpeg'),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 270,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          '   ${data[index]['userId']}  ${data[index]['postCreateDate']}\n',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 270,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          '  ${data[index]['postName']}',
                                          style: const TextStyle(fontSize: 20),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
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

  _disposeSaharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      pref.clear(); //지워버리기>>이거 didChangeAppLifecycleState부분 자동로그인에 응용 안하면 SaharedPreferences내용 남아있으니까
    });
  }
}//end
