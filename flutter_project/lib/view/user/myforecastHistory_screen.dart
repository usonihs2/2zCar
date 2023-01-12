import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/user/message.dart';
import 'package:flutter_project/model/user/record.dart';
import 'package:flutter_project/model/user/user_message.dart';
import 'package:flutter_project/view/user/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyforecastHistoryScreen extends StatefulWidget {
  const MyforecastHistoryScreen({super.key});

  @override
  State<MyforecastHistoryScreen> createState() =>
      _MyforecastHistoryScreenState();
}

class _MyforecastHistoryScreenState extends State<MyforecastHistoryScreen> {
  late List data;
  var value = Get.arguments ?? '_';

  @override
  void initState() {
    super.initState();
    data = [];
    // getJsonData();
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
      body: StreamBuilder<QuerySnapshot>(
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
          return ListView(
            children: documents.map((e) => _buildItemWidget(e)).toList(),
          );
        },
      ),
    );
  }

  // --- function ---
  Widget _buildItemWidget(DocumentSnapshot doc) {
    final record = Record(
        brand: doc["brand"],
        date: doc["date"] ?? Timestamp(0, 0),
        drive: doc["drive"],
        fuel: doc["fuel"],
        model: doc["model"],
        odometer: doc["odometer"],
        priceRange: doc["priceRange"],
        transmission: doc["transmission"],
        userId: doc["userId"],
        year: doc["year"]);
    print('${record.date}');
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
            child: ListTile(
              title: Text(
                  'brand : ${record.brand} \n date: ${record.date.toDate()} \n drive: ${record.drive} \n fuel: ${record.fuel} \n model: ${record.model} \n odometer: ${record.odometer} \n priceRange: ${record.priceRange} \n transmission: ${record.transmission} \n userId: ${record.userId} \n year: ${record.year}'),
            ),
          ),
        ),
      ),
    );
  }

  _disposeSaharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      pref.clear(); //지워버리기>>이거 didChangeAppLifecycleState부분 자동로그인에 응용 안하면 SaharedPreferences내용 남아있으니까
    });
  }
} // End
