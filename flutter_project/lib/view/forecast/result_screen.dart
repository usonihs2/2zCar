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
    starCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: Scaffold(
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (starCheck == false) {
                      starCheck = true;
                      print(DateTime.now());
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
              Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// --- Function ---

// .where('user_id', isEqualto('sas')
