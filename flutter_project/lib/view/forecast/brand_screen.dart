import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/repository.dart';
import 'package:flutter_project/view/forecast/detail_screen.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreen();
}

class _BrandScreen extends State<BrandScreen> {
  late List brandImage;
  late double opacityLevel1; //투명도를 통해 이미지를 클릭 확인
  late double opacityLevel2;
  late double opacityLevel3;
  late double opacityLevel4;

  @override
  void initState() {
    super.initState();
    brandImage = [
      "images/ford.png",
      "images/benz.png",
      "images/bmw.png",
      "images/kia.png",
    ];
    Repository.brandImage = "images/ford.png";
    opacityLevel1 = 1; // 이미지 선택시 투명도
    opacityLevel2 = 0.3; // 기본 이미지 투명도
    opacityLevel3 = 0.3;
    opacityLevel4 = 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Repository.brandImage, //브랜드 선택페이지에서 저장한 브랜드 이미지
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Repository.brandImage = brandImage[0];
                              setState(() {
                                opacityLevel1 = 1;
                                opacityLevel2 = 0.3;
                                opacityLevel3 = 0.3;
                                opacityLevel4 = 0.3;
                              });
                            },
                            child: Opacity(
                              opacity: opacityLevel1,
                              child: Container(
                                child: Image.asset(
                                  "images/ford.png",
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Repository.brandImage = brandImage[1];
                        setState(() {
                          opacityLevel1 = 0.3;
                          opacityLevel2 = 1;
                          opacityLevel3 = 0.3;
                          opacityLevel4 = 0.3;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Opacity(
                                opacity: opacityLevel2,
                                child: Image.asset(
                                  "images/benz.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Repository.brandImage = brandImage[2];
                        setState(() {
                          opacityLevel1 = 0.3;
                          opacityLevel2 = 0.3;
                          opacityLevel3 = 1;
                          opacityLevel4 = 0.3;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Opacity(
                                opacity: opacityLevel3,
                                child: Image.asset(
                                  "images/bmw.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Repository.brandImage = brandImage[3];
                        setState(() {
                          opacityLevel1 = 0.3;
                          opacityLevel2 = 0.3;
                          opacityLevel3 = 0.3;
                          opacityLevel4 = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Opacity(
                                opacity: opacityLevel4,
                                child: Image.asset(
                                  "images/kia.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } //
}//end
