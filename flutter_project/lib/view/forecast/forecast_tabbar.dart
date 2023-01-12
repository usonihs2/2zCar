import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/model/user/user_message.dart';
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
                        priceRangeSet();
                        addAction();
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
        'http://192.168.10.214:8080/Rserve/rf_${Repository.modelPath}.jsp?year=${ForecastResult.year}&transmission=${ForecastResult.transmission}&fuel=${ForecastResult.fuel}&odometer=${ForecastResult.odometer}&drive=${ForecastResult.drive}');
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

  addAction() {
    FirebaseFirestore.instance.collection('forecast').add(
      {
        'userId': UserMessage.userId,
        'brand': Repository.brandName,
        'model': Repository.modelName,
        'year': ForecastResult.year,
        'odometer': ForecastResult.odometer,
        'fuel': ForecastResult.fuelName,
        'transmission': ForecastResult.transmissionName,
        'drive': ForecastResult.driveName,
        'priceRange': ForecastResult.priceRange,
        'date': DateTime.now(),
      },
    );
  }

  priceRangeSet() {
    if (Repository.modelName == 'F-150') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '8,000\$ ~ 17,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '11,000\$ ~ 23,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '35,000\$ ~ 46,000\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '27,000\$ ~ 38,000\$';
      } else {
        ForecastResult.priceRange = '18,000\$ ~ 30,000\$';
      }
    } else if (Repository.modelName == 'Escape') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '13,000\$ ~ 17,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '17,500\$ ~ 22,500\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4,000\$ ~ 6,500\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '9,000\$ ~ 13,000\$';
      } else {
        ForecastResult.priceRange = '6,000\$ ~ 9500\$';
      }
    } else if (Repository.modelName == 'Explorer') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '28,000\$ ~ 38,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '12,000\$ ~ 19,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '18,500\$ ~ 26,500\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '3,500\$ ~ 8,500\$';
      } else {
        ForecastResult.priceRange = '6,000\$ ~ 13,000\$';
      }
    } else if (Repository.modelName == '328i') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '4,800\$ ~ 7,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '10,000\$ ~ 16,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '6,000\$ ~ 9,000\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '12,000\$ ~ 18,000\$';
      } else {
        ForecastResult.priceRange = '8,400\$ ~ 12,000\$';
      }
    } else if (Repository.modelName == 'X3') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6,500\$ ~ 11,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '26,000\$ ~ 35,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '15,000\$ ~ 23,000\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '4,700\$ ~ 7,000\$';
      } else {
        ForecastResult.priceRange = '9,000\$ ~ 14,000\$';
      }
    } else if (Repository.modelName == 'X5') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6,300\$ ~ 11,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '14,000\$ ~ 25,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4,000\$ ~ 8,000\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '28,000\$ ~ 37,000\$';
      } else {
        ForecastResult.priceRange = '9,000\$ ~ 16,000\$';
      }
    } else if (Repository.modelName == 'C-Class') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '9,000\$ ~ 14,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '24,000\$ ~ 33,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '0\$ ~ 9,000\$';
      } else {
        ForecastResult.priceRange = '14,000\$ ~ 24,000\$';
      }
    } else if (Repository.modelName == 'E-Class') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '0\$ ~ 8,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '8,000\$ ~ 12,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '12,000\$ ~ 20,000\$';
      } else {
        ForecastResult.priceRange = '20,000\$ ~ 34,000\$';
      }
    } else if (Repository.modelName == 'S-Class') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '14,500\$ ~ 34,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '0\$ ~ 8,500\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '8,500\$ ~ 14,500\$';
      } else {
        ForecastResult.priceRange = '34,000\$ ~ 57,000\$';
      }
    } else if (Repository.modelName == 'Soul') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '5,000\$ ~ 7,500\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '15,000\$ ~ 20,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '7,000\$ ~ 9,500\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '11,500\$ ~ 15,000\$';
      } else {
        ForecastResult.priceRange = '8,500\$ ~ 12,000\$';
      }
    } else if (Repository.modelName == 'Optima') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '4,000\$ ~ 8,000\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '11,000\$ ~ 15,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '9,000\$ ~ 13,000\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '16,000\$ ~ 20,000\$';
      } else {
        ForecastResult.priceRange = '7,500\$ ~ 10,000\$';
      }
    } else if (Repository.modelName == 'Forte') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6,000\$ ~ 7,500\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '7,500\$ ~ 11,000\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '15,000\$ ~ 18,500\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '9,500\$ ~ 14,000\$';
      } else {
        ForecastResult.priceRange = '3,500\$ ~ 6,000\$';
      }
    }
  }
} // End
