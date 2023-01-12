import 'package:flutter/material.dart';
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
      body: Center(
        child: data.isEmpty
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
