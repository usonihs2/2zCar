import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/user/message.dart';
import 'package:flutter_project/model/user/record.dart';
import 'package:flutter_project/model/user/user_message.dart';
import 'package:flutter_project/view/forecast/forecast_tabbar.dart';
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
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
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
                  Center(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('forecast') // collection > table이름
                          .where('userId', isEqualTo: UserMessage.userId)
                          .orderBy('date', descending: true)
                          .limit(1)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final documents = snapshot.data!.docs; // docs : 내용물
                        return ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: documents
                              .map((e) => _buildItemWidget(e))
                              .toList(),
                        );
                      },
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

  // --- function ---
  Widget _buildItemWidget(DocumentSnapshot doc) {
    final record = Record(
      brand: doc["brand"],
      date: doc["date"],
      drive: doc["drive"],
      fuel: doc["fuel"],
      model: doc["model"],
      odometer: doc["odometer"],
      priceRange: doc["priceRange"],
      transmission: doc["transmission"],
      userId: doc["userId"],
      year: doc["year"],
    );
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_forever),
      ),
      key: ValueKey(doc),
      onDismissed: (direction) {
        FirebaseFirestore.instance.collection('forecast').doc(doc.id).delete();
      },
      child: Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            Message.id = doc.id;
            Message.brand = doc["brand"];
            Message.date = doc["date"];
            Message.drive = doc["drive"];
            Message.fuel = doc["fuel"];
            Message.model = doc["model"];
            Message.odometer = doc["odometer"];
            Message.priceRange = doc["priceRange"];
            Message.transmission = doc["transmission"];
            Message.userId = doc["userId"];
            Message.year = doc["year"];
          },
          child: Card(
            color: Colors.white70,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    // ignore: unnecessary_string_interpolations
                    '${record.brand}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '사용자ID: ${record.userId} \n날짜: ${record.date} \n구동방식: ${record.drive} \n연료: ${record.fuel} \n모델: ${record.model} \n주행기록: ${record.odometer} \n가격: ${record.priceRange} \n변속기: ${record.transmission}  \n연식: ${record.year}',
                          // style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
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
