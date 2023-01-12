import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/forecast_message.dart';
import 'package:flutter_project/model/forecast/repository.dart';
import 'package:flutter_project/view/forecast/forecast_tabbar.dart';
import 'package:flutter_project/view/user/main_screen.dart';

import '../../model/forecast/reset_static.dart';

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
        title: const Text('예측결과'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              Repository.brandImage,
              width: 300,
              height: 300,
            ),
            Row(
              children: [
                Image.asset(
                  Repository.modelImage,
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('제조사 : ${Repository.brandName}'),
                    Text('차량명 : ${Repository.modelName}'),
                    Text('연식 : ${ForecastResult.year}'),
                    Text('주행거리 : ${ForecastResult.odometer}'),
                    Text('연료 : ${ForecastResult.fuelName}'),
                    Text('변속기 : ${ForecastResult.transmissionName}'),
                    Text('구동방식 : ${ForecastResult.driveName}'),
                  ],
                ),
              ],
            ),
            Text('예상 가격은 ${ForecastResult.priceRange} 입니다.'),
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
                    onPressed: () {
                      ResetStatic.resetStatic();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MainScreen();
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