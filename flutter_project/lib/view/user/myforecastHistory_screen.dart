import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/user/message.dart';
import 'package:flutter_project/model/user/record.dart';
import 'package:flutter_project/model/user/user_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyforecastHistoryScreen extends StatefulWidget {
  const MyforecastHistoryScreen({super.key});

  @override
  State<MyforecastHistoryScreen> createState() =>
      _MyforecastHistoryScreenState();
}

class _MyforecastHistoryScreenState extends State<MyforecastHistoryScreen> {
  late int num;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    num = 0;
    // Message.num = num;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가격 예측 기록'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // _disposeSaharedPreferences();
        //       value == false ? _disposeSaharedPreferences() : null;
        //       Get.offAll(
        //         const LoginScreen(),
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.logout_sharp,
        //     ),
        //   ),
        // ],
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('forecast') // collection > table이름
              .where('userId', isEqualTo: UserMessage.userId)
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = snapshot.data!.docs; // docs : 내용물
            // num = snapshot.data!.docs.length;

            return ListView(
              children: documents.map((e) => _buildItemWidget(e)).toList(),
            );
          },
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

  _disposeSaharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      pref.clear(); //지워버리기>>이거 didChangeAppLifecycleState부분 자동로그인에 응용 안하면 SaharedPreferences내용 남아있으니까
    });
  }
} // End
