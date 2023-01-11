import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/forecast_message.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String price;

  late bool starCheck;

  @override
  void initState() {
    super.initState();
    if (ForecastResult.forecastResult == '1') {
      price = '10,000 ~ 15,000';
    } else if (ForecastResult.forecastResult == '2') {
      price = '15,000 ~ 20,000';
    } else if (ForecastResult.forecastResult == '3') {
      price = '20,000 ~ 25,000';
    } else if (ForecastResult.forecastResult == '4') {
      price = '25,000 ~ 30,000';
    } else {
      price = '30,000 ~ 35,000';
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
                    const Text('차량명 : ㅁㄴㅇㄹㅁㄴㅇㄹ'),
                    Text('연식 : ${ForecastResult.year}'),
                    Text('주행거리 : ${ForecastResult.odometer}'),
                    Text('연료 : ${ForecastResult.fuelName}'),
                    Text('실린더 : ${ForecastResult.cylindersName}'),
                    Text('구동방식 : ${ForecastResult.driveName}'),
                    Text('차량크기 : ${ForecastResult.sizeName}'),
                  ],
                ),
              ],
            ),
            Text('예상 가격은 $price 입니다.'),
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
                      Icons.star_border,
                      color: Colors.amber,
                      size: 100,
                    )
                  : const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 100,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
