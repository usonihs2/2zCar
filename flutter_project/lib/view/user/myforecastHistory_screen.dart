import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              // _disposeSaharedPreferences();
              value == false ? _disposeSaharedPreferences() : null;
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('students') // collection > table이름
            .orderBy('code', descending: false)
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
    final student = Student(
        code: doc["code"],
        name: doc["name"],
        dept: doc["dept"],
        phone: doc["phone"]);
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_forever),
      ),
      key: ValueKey(doc),
      onDismissed: (direction) {
        FirebaseFirestore.instance.collection('students').doc(doc.id).delete();
      },
      child: Container(
        color: Colors.amberAccent,
        child: GestureDetector(
          onTap: () {
            UserMessage.id = doc.id;
            UserMessage.code = doc['code'];
            UserMessage.name = doc['name'];
            UserMessage.dept = doc['dept'];
            UserMessage.phone = doc['phone'];
          },
          child: Card(
            child: ListTile(
              title: Text(
                  '학번 : ${student.code} \n이름: ${student.name} \n학번: ${student.dept} \n전화번호: ${student.phone}'),
            ),
          ),
        ),
      ),
    );
  }
  // --- Functions
  // date: 2022.12.28
  // desc: select data for street cats!
  // Future<bool> getJsonData() async {
  //   var url = Uri.parse(
  //       'http://localhost:8080/Flutter/streetCat_post_query_flutter.jsp');

  //   var response = await http.get(url);
  //   // print(response.body);
  //   //data.clear(); // clear data so that only inserted is added
  //   // data from db is JSON and is converted
  //   var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //   // converted data is put into result
  //   List result = dataConvertedJSON['results'];

  //   setState(() {
  //     data = result;
  //   });
  //   return true;
  // }

  _disposeSaharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      pref.clear(); //지워버리기>>이거 didChangeAppLifecycleState부분 자동로그인에 응용 안하면 SaharedPreferences내용 남아있으니까
    });
  }
} // End
