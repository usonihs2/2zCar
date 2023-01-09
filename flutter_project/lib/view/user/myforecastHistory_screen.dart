import 'package:flutter/material.dart';

class MyforecastHistoryScreen extends StatefulWidget {
  const MyforecastHistoryScreen({super.key});

  @override
  State<MyforecastHistoryScreen> createState() =>
      _MyforecastHistoryScreenState();
}

class _MyforecastHistoryScreenState extends State<MyforecastHistoryScreen> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가격 예측 기록'),
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
} // End
