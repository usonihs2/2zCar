import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/forecast_message.dart';
import 'package:flutter_project/model/forecast/repository.dart';
import 'package:flutter_project/view/forecast/forecast_tabbar.dart';

import '../../model/forecast/reset_static.dart';
import '../user/user_tabbar.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late bool starCheck;

  @override
  void initState() {
    super.initState();
    starCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2Z Car'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              Repository.brandImage,
              width: 150,
              height: 150,
            ),
            Row(
              children: [
                Image.asset(
                  Repository.modelImage,
                  width: 220,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        '제조사 : ${Repository.brandName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        '차량명 : ${Repository.modelName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        '연식 : ${ForecastResult.year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        '주행거리 : ${ForecastResult.odometer}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        '연료 : ${ForecastResult.fuelName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        '변속기 : ${ForecastResult.transmissionName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        '구동방식 : ${ForecastResult.driveName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text(
                '예상 가격은 ${ForecastResult.priceRange} 입니다.',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (starCheck == false) {
                        starCheck = true;
                      } else {
                        starCheck = false;
                      }
                    });
                  },
                  child: starCheck == false
                      ? const Icon(
                          CupertinoIcons.heart,
                          color: Colors.red,
                          size: 50,
                        )
                      : const Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 50,
                        ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ResetStatic.resetStatic();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForecastTabbar();
                          },
                        ),
                      );
                    },
                    icon: const Icon(CupertinoIcons.restart),
                    label: const Text('다시하기'),
                    style: ElevatedButton.styleFrom(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () {
                      ResetStatic.resetStatic();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const UserTabbar();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.home),
                    label: const Text('홈'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// --- Function ---

// resetStatic() {
//   Repository.brandImage = "";
//   Repository.brandName = "";
//   Repository.modelImage = "";
//   Repository.modelName = "";
//   Repository.modelPath = "";
//   ForecastResult.year = 'select year';
//   ForecastResult.fuel = '';
//   ForecastResult.odometer = '';
//   ForecastResult.transmission = '';
//   ForecastResult.drive = '';

//   ForecastResult.fuelName = 'select fuel';
//   ForecastResult.transmissionName = 'select transmission';
//   ForecastResult.driveName = 'select drive';

//   ForecastResult.forecastResult = '';
//   ForecastResult.priceRange = '';
// }

// project-154732217273