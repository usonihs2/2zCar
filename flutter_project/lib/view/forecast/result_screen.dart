import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/forecast_message.dart';
import 'package:flutter_project/model/forecast/repository.dart';

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
                      size: 100,
                    )
                  : const Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                      size: 100,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
  // --- Function ---

// .where('user_id', isEqualto('sas')