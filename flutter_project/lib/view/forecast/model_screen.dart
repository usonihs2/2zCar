import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/repository.dart';
import 'package:flutter_project/view/forecast/detail_screen.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreen();
}

class _ModelScreen extends State<ModelScreen> {
  late String brand;
  late List model;
  late List name;

  @override
  void initState() {
    super.initState();
    Repository.imagePath == 'images/kia.jpeg'
        ? model = [
            'images/soul.jpeg',
            'images/optima.jpeg',
            'images/sorento.jpeg',
          ]
        : Repository.imagePath == 'images/audi.png'
            ? model = [
                'images/a4.png',
                'images/a6.png',
                'images/q5.png',
              ]
            : Repository.imagePath == "images/bmw.jpeg"
                ? model = [
                    'images/bmw.jpeg',
                    'images/bmw.jpeg',
                    'images/bmw.jpeg',
                  ]
                : model = [
                    "images/benz.jpeg",
                    "images/benz.jpeg",
                    "images/benz.jpeg",
                  ];
    Repository.imagePath == 'images/kia.jpeg'
        ? name = [
            'soul',
            'optima',
            'sorento',
          ]
        : Repository.imagePath == 'images/audi.png'
            ? name = [
                'a4',
                'a6',
                'q5',
              ]
            : Repository.imagePath == "images/bmw.jpeg"
                ? name = [
                    '차이름',
                    '차이름',
                    '차이름',
                  ]
                : name = [
                    "차이름",
                    "차이름",
                    "차이름",
                  ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Repository.imagePath,
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Repository.modelname = name[0];
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          model[0],
                          width: 100,
                          height: 100,
                        ),
                        Text(name[0]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          model[1],
                          width: 100,
                          height: 100,
                        ),
                        Text(name[1]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          model[2],
                          width: 100,
                          height: 100,
                        ),
                        Text(name[2]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen();
                  }));
                },
                child: const Text(
                  "다음",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}//end
