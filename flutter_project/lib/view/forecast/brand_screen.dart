import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project/model/forecast/repository.dart';
import 'package:flutter_project/view/forecast/model_screen.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreen();
}

class _BrandScreen extends State<BrandScreen> {
  late bool ford;
  late bool benz;
  late bool bmw;
  late bool kia;
  late List images;
  late int selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ford = true;
    benz = false;
    bmw = false;
    kia = false;
    images = [
      "images/ford.png",
      "images/benz.png",
      "images/bmw.png",
      "images/kia.png",
    ];
    selectedItem = 0;
    Repository.brandImage = "images/ford.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "${images[selectedItem]}",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    width: 250,
                    height: 200,
                    child: CupertinoPicker(
                        backgroundColor: Colors.white10,
                        itemExtent: 30,
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedItem = value;
                            Repository.brandImage = "${images[selectedItem]}";
                          });
                        },
                        children: [
                          Image.asset(images[0]),
                          Image.asset(images[1]),
                          Image.asset(images[2]),
                          Image.asset(images[3]),
                        ]),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Column(
            //     children: [
            //       ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.black,
            //         ),
            //         onPressed: () {
            //           Repository.imagePath = "${images[selectedItem]}";
            //           print(Repository.imagePath);
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) {
            //             return ModelScreen();
            //           }));
            //         },
            //         child: const Text("다음"),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
