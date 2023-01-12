import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/repository.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreen();
}

class _ModelScreen extends State<ModelScreen> {
  late List modelImage;
  late List modelName;
  late String brandName;
  late List modelPath;
  late double opacityLevel1; //투명도를 통해 이미지를 클릭 확인
  late double opacityLevel2;
  late double opacityLevel3;

  @override
  void initState() {
    super.initState();

    opacityLevel1 = 1; // 이미지 선택시 투명도
    opacityLevel2 = 0.3; // 기본 이미지 투명도
    opacityLevel3 = 0.3;
    //선택 안했을시 초기값 - 모델명
    Repository.brandImage == 'images/kia.png'
        ? Repository.modelName = "Soul"
        : Repository.brandImage == "images/ford.png"
            ? Repository.modelName = "F-150"
            : Repository.brandImage == "images/bmw.png"
                ? Repository.modelName = "X5"
                : Repository.modelName = "C-Class";
    //선택 안했을시 초기값 - modelPath
    Repository.brandImage == 'images/kia.png'
        ? Repository.modelPath = "soul"
        : Repository.brandImage == "images/ford.png"
            ? Repository.modelPath = "f150"
            : Repository.brandImage == "images/bmw.png"
                ? Repository.modelPath = "x5"
                : Repository.modelPath = "cclass";
    //선택 안했을시 초기값 - 모델이미지
    Repository.brandImage == 'images/kia.png'
        ? Repository.modelImage = "images/soul.png"
        : Repository.brandImage == "images/ford.png"
            ? Repository.modelImage = "images/f-150.png"
            : Repository.brandImage == "images/bmw.png"
                ? Repository.modelImage = "images/x5.png"
                : Repository.modelImage = "images/c.png";
    //선택 안했을시 초기값 - 브랜드명
    Repository.brandImage == 'images/kia.png'
        ? Repository.brandName = "Kia"
        : Repository.brandImage == "images/ford.png"
            ? Repository.brandName = "Ford"
            : Repository.brandImage == "images/bmw.png"
                ? Repository.brandName = "Bmw"
                : Repository.brandName = "Benz";

    //브랜드 선택화면에서 브랜드 선택시 해당하는 모델들 - 이미지/모델명/브랜드명/모델패스
    Repository.brandImage == 'images/kia.png'
        ? modelImage = [
            'images/soul.png',
            'images/optima.png',
            'images/forte.png',
          ]
        : Repository.brandImage == "images/ford.png"
            ? modelImage = [
                'images/f-150.png',
                'images/escape.png',
                'images/explorer.png',
              ]
            : Repository.brandImage == "images/bmw.png"
                ? modelImage = [
                    'images/x5.png',
                    'images/328i.png',
                    'images/x3.png',
                  ]
                : modelImage = [
                    "images/c.png",
                    "images/e.png",
                    "images/s.png",
                  ];
    Repository.brandImage == 'images/kia.png'
        ? modelName = [
            'Soul',
            'Optima',
            'Forte',
          ]
        : Repository.brandImage == "images/ford.png"
            ? modelName = [
                'F-150',
                'Escape',
                'Explorer',
              ]
            : Repository.brandImage == "images/bmw.png"
                ? modelName = [
                    'X5',
                    '328i',
                    'X3',
                  ]
                : modelName = [
                    "C-Class",
                    "E-Class",
                    "S-Class",
                  ];
    Repository.brandImage == 'images/kia.png'
        ? modelPath = [
            'soul',
            'optima',
            'forte',
          ]
        : Repository.brandImage == "images/ford.png"
            ? modelPath = [
                'f150',
                'escape',
                'explorer',
              ]
            : Repository.brandImage == "images/bmw.png"
                ? modelPath = [
                    'x5',
                    '328i',
                    'x3',
                  ]
                : modelPath = [
                    "cclass",
                    "eclass",
                    "sclass",
                  ];
    Repository.brandImage == 'images/kia.png'
        ? brandName = "Kia"
        : Repository.brandImage == "images/ford.png"
            ? brandName = "Ford"
            : Repository.brandImage == "images/bmw.png"
                ? brandName = "Bmw"
                : brandName = "Benz";
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
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Repository.modelName =
                              modelName[0]; //Repository에 모델명 저장
                          Repository.modelImage =
                              modelImage[0]; //Repository에 모델이미지 저장
                          Repository.brandName =
                              brandName; //Repository에 브랜드명 저장
                          Repository.modelPath =
                              modelPath[0]; //Repository에 브랜드명 저장
                          setState(() {
                            // opacityLevel1 = opacityLevel1 == 0.3 ? 1.0 : 0.3;
                            opacityLevel1 = 1;
                            opacityLevel2 = 0.3;
                            opacityLevel3 = 0.3;
                          });
                        },
                        child: Opacity(
                          opacity: opacityLevel1,
                          child: Image.asset(
                            modelImage[0],
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      Text(modelName[0]),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Repository.modelName = modelName[1];
                    Repository.modelImage = modelImage[1];
                    Repository.brandName = brandName;
                    Repository.modelPath = modelPath[1];
                    setState(() {
                      // opacityLevel2 = opacityLevel2 == 0.3 ? 1.0 : 0.3;
                      opacityLevel1 = 0.3;
                      opacityLevel2 = 1;
                      opacityLevel3 = 0.3;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Opacity(
                          opacity: opacityLevel2,
                          child: Image.asset(
                            modelImage[1],
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text(modelName[1]),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Repository.modelName = modelName[2];
                    Repository.modelImage = modelImage[2];
                    Repository.brandName = brandName;
                    Repository.modelPath = modelPath[2];
                    setState(() {
                      // opacityLevel3 = opacityLevel3 == 0.3 ? 1.0 : 0.3;
                      opacityLevel1 = 0.3;
                      opacityLevel2 = 0.3;
                      opacityLevel3 = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Opacity(
                          opacity: opacityLevel3,
                          child: Image.asset(
                            modelImage[2],
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text(modelName[2]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } //
}//end
