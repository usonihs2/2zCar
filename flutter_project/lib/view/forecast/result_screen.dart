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
        ForecastResult.priceRange = '6296\$ ~ 10961\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '13997\$ ~ 25175\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4348\$ ~ 7874\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '28242\$ ~ 36998\$';
      } else {
        ForecastResult.priceRange = '8845\$ ~ 15996\$';
      }
    } else if (Repository.modelName == 'E-Class') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6296\$ ~ 10961\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '13997\$ ~ 25175\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4348\$ ~ 7874\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '28242\$ ~ 36998\$';
      } else {
        ForecastResult.priceRange = '8845\$ ~ 15996\$';
      }
    } else if (Repository.modelName == 'S-Class') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6296\$ ~ 10961\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '13997\$ ~ 25175\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4348\$ ~ 7874\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '28242\$ ~ 36998\$';
      } else {
        ForecastResult.priceRange = '8845\$ ~ 15996\$';
      }
    } else if (Repository.modelName == 'Soul') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6296\$ ~ 10961\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '13997\$ ~ 25175\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4348\$ ~ 7874\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '28242\$ ~ 36998\$';
      } else {
        ForecastResult.priceRange = '8845\$ ~ 15996\$';
      }
    } else if (Repository.modelName == 'Optima') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6296\$ ~ 10961\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '13997\$ ~ 25175\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4348\$ ~ 7874\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '28242\$ ~ 36998\$';
      } else {
        ForecastResult.priceRange = '8845\$ ~ 15996\$';
      }
    } else if (Repository.modelName == 'Forte') {
      if (ForecastResult.forecastResult == '1') {
        ForecastResult.priceRange = '6296\$ ~ 10961\$';
      } else if (ForecastResult.forecastResult == '2') {
        ForecastResult.priceRange = '13997\$ ~ 25175\$';
      } else if (ForecastResult.forecastResult == '3') {
        ForecastResult.priceRange = '4348\$ ~ 7874\$';
      } else if (ForecastResult.forecastResult == '4') {
        ForecastResult.priceRange = '28242\$ ~ 36998\$';
      } else {
        ForecastResult.priceRange = '8845\$ ~ 15996\$';
      }
    }
//---
    if (ForecastResult.forecastResult == '1') {
      ForecastResult.priceRange = '10,000\$ ~ 15,000\$';
    } else if (ForecastResult.forecastResult == '2') {
      ForecastResult.priceRange = '15,000\$ ~ 20,000\$';
    } else if (ForecastResult.forecastResult == '3') {
      ForecastResult.priceRange = '20,000\$ ~ 25,000\$';
    } else if (ForecastResult.forecastResult == '4') {
      ForecastResult.priceRange = '25,000\$ ~ 30,000\$';
    } else {
      ForecastResult.priceRange = '30,000\$ ~ 35,000\$';
    }
// ---
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
              'images/audi.png',
              width: 300,
            ),
            Row(
              children: [
                Image.asset(
                  'images/a4.jpeg',
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('제조사 : ${Repository.brandName}'),
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