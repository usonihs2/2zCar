import 'package:flutter_project/view/forecast/result_screen.dart';

import '../../model/forecast/forecast_message.dart';
import '../../model/forecast/repository.dart';
import 'brand_screen.dart';
import 'detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model_screen.dart';
import 'dart:convert';

class ForecastTabbar extends StatefulWidget {
  const ForecastTabbar({super.key});

  @override
  State<ForecastTabbar> createState() => _ForecastTabbarState();
}

class _ForecastTabbarState extends State<ForecastTabbar>
    with SingleTickerProviderStateMixin {
  String result = 'all';
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('예측하기'),
          bottom: TabBar(
            onTap: (value) {
              setState(() {
                //
              });
            },
            controller: tabController,
            labelColor: Colors.amber,
            indicatorColor: Colors.amber,
            unselectedLabelColor: Colors.red,
            tabs: const <Widget>[
              Tab(
                // icon: Icon(Icons.abc),
                text: 'Brand',
              ),
              Tab(
                // icon: Icon(CupertinoIcons.car_detailed),
                text: 'Model',
              ),
              Tab(
                // icon: Icon(Icons.abc),
                text: 'Detail',
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            BrandScreen(),
            ModelScreen(),
            DetailScreen(),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 105, 50),
          child: SizedBox(
            width: 150,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              splashColor: Colors.purpleAccent,
              backgroundColor: Colors.amber,
              onPressed: () {
                setState(
                  () {
                    if (tabController.index < 2) {
                      tabController.index = tabController.index + 1;
                    } else {
                      forecastAction();
                    }
                  },
                );
              },
              child:
                  tabController.index < 2 ? const Text('다음') : const Text('예측'),
            ),
          ),
        ),
      ),
    );
  }
  // --- Function ---

  _showDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('입력 내용'),
          content: Text(
            '제조사 : ${Repository.brandName}\n모델명 : ${Repository.modelName}\n연식 : ${ForecastResult.year}\n주행거리 : ${ForecastResult.odometer}\n연료 : ${ForecastResult.fuelName}\n변속기 : ${ForecastResult.transmissionName}\n구동방식 : ${ForecastResult.driveName}',
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '취소',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        getJSONData();
                        ForecastResult.forecastResult = result;
                      },
                    );
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ResultScreen();
                      },
                    ));
                  },
                  child: const Text('예측'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/rf_${Repository.modelPath}.jsp?year=${ForecastResult.year}&transmission=${ForecastResult.transmission}&fuel=${ForecastResult.fuel}&odometer=${ForecastResult.odometer}&drive=${ForecastResult.drive}');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
  }

  forecastAction() {
    if (ForecastResult.year == 'select year' ||
        ForecastResult.transmission == '' ||
        ForecastResult.fuel == '' ||
        ForecastResult.odometer.isEmpty ||
        ForecastResult.drive == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('모두 입력해주세요.'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      _showDialog(context, result);
    }
  }
} // End
