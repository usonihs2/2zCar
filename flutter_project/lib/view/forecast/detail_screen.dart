import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/forecast_message.dart';
import 'package:flutter_project/view/forecast/result_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController odometerController;

  String result = 'all';
  late List yearList;
  late List cylinderList;
  late List fuelList;
  late List driveList;
  late List sizeList;

  late int selectedItemYear;
  late int selectedItemCylinders;
  late int selectedItemFuel;
  late int selectedItemDrive;
  late int selectedItemSize;

  @override
  void initState() {
    super.initState();

    yearList = [
      for (int i = 2000; i <= 2020; i++)
        {
          i,
        },
    ];
    cylinderList = [
      '3 cylinders',
      '4 cylinders',
      '5 cylinders',
      '6 cylinders',
      '8 cylinders',
      '10 cylinders',
      '12 cylinders',
      'other',
    ];
    fuelList = [
      'diesel',
      'electric',
      'gas',
      'hybrid',
      'other',
    ];
    driveList = [
      '4wd',
      'fwd',
      'rwd',
    ];
    sizeList = [
      'full-size',
      'mid-size',
      'compact',
      'sub-compact',
    ];
    odometerController = TextEditingController();

    selectedItemYear = 0;
    selectedItemCylinders = 0;
    selectedItemFuel = 0;
    selectedItemDrive = 0;
    selectedItemSize = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: const [Text('Year')],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (ForecastResult.year == 'select year') {
                              ForecastResult.year =
                                  yearList[0].toString().substring(1, 5);
                            }
                          });
                          _showYearPicker();
                        },
                        child: Text(ForecastResult.year)),
                  ],
                ),
                Row(
                  children: const [Text('Cylinder')],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (ForecastResult.cylinders == '') {
                              ForecastResult.cylindersName = cylinderList[0];
                              ForecastResult.cylinders = '1';
                            }
                          });
                          _showCylindersPicker();
                        },
                        child: Text(ForecastResult.cylindersName)),
                  ],
                ),
                Row(
                  children: const [Text('Fuel')],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (ForecastResult.fuel == '') {
                              ForecastResult.fuelName = fuelList[0];
                              ForecastResult.fuel = '1';
                            }
                          });
                          _showFuelPicker();
                        },
                        child: Text(ForecastResult.fuelName)),
                  ],
                ),
                TextField(
                  controller: odometerController,
                  onChanged: (value) {
                    ForecastResult.odometer = odometerController.text;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'odometer',
                  ),
                ),
                Row(
                  children: const [Text('Drive')],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (ForecastResult.drive == '') {
                              ForecastResult.driveName = driveList[0];
                              ForecastResult.drive = '1';
                            }
                          });
                          _showDrivePicker();
                        },
                        child: Text(ForecastResult.driveName)),
                  ],
                ),
                Row(
                  children: const [Text('Size')],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (ForecastResult.size == '') {
                              ForecastResult.sizeName = sizeList[0];
                              ForecastResult.size = '1';
                            }
                          });
                          _showSizePicker();
                        },
                        child: Text(ForecastResult.sizeName)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Function ---

  _showYearPicker() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: CupertinoPicker(
                magnification: 1.1,
                squeeze: 1.45,
                itemExtent: 30,
                scrollController:
                    FixedExtentScrollController(initialItem: selectedItemYear),
                diameterRatio: 1.1,
                onSelectedItemChanged: (value) {
                  setState(
                    () {
                      selectedItemYear = value;
                      ForecastResult.year =
                          '${yearList[selectedItemYear]}'.substring(1, 5);
                    },
                  );
                },
                children: [
                  Text('${yearList[0]}'.substring(1, 5)),
                  Text('${yearList[1]}'.substring(1, 5)),
                  Text('${yearList[2]}'.substring(1, 5)),
                  Text('${yearList[3]}'.substring(1, 5)),
                  Text('${yearList[4]}'.substring(1, 5)),
                  Text('${yearList[5]}'.substring(1, 5)),
                  Text('${yearList[6]}'.substring(1, 5)),
                  Text('${yearList[7]}'.substring(1, 5)),
                  Text('${yearList[8]}'.substring(1, 5)),
                  Text('${yearList[9]}'.substring(1, 5)),
                  Text('${yearList[10]}'.substring(1, 5)),
                  Text('${yearList[11]}'.substring(1, 5)),
                  Text('${yearList[12]}'.substring(1, 5)),
                  Text('${yearList[13]}'.substring(1, 5)),
                  Text('${yearList[14]}'.substring(1, 5)),
                  Text('${yearList[15]}'.substring(1, 5)),
                  Text('${yearList[16]}'.substring(1, 5)),
                  Text('${yearList[17]}'.substring(1, 5)),
                  Text('${yearList[18]}'.substring(1, 5)),
                  Text('${yearList[19]}'.substring(1, 5)),
                  Text('${yearList[20]}'.substring(1, 5)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showCylindersPicker() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: CupertinoPicker(
                magnification: 1.1,
                squeeze: 1.45,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(
                    initialItem: selectedItemCylinders),
                diameterRatio: 1.1,
                onSelectedItemChanged: (value) {
                  setState(
                    () {
                      selectedItemCylinders = value;
                      ForecastResult.cylindersName =
                          cylinderList[selectedItemCylinders];
                      ForecastResult.cylinders =
                          (selectedItemCylinders.toInt() + 1).toString();
                    },
                  );
                },
                children: [
                  Text(cylinderList[0]),
                  Text(cylinderList[1]),
                  Text(cylinderList[2]),
                  Text(cylinderList[3]),
                  Text(cylinderList[4]),
                  Text(cylinderList[5]),
                  Text(cylinderList[6]),
                  Text(cylinderList[7]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showFuelPicker() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: CupertinoPicker(
                magnification: 1.1,
                squeeze: 1.45,
                itemExtent: 30,
                scrollController:
                    FixedExtentScrollController(initialItem: selectedItemFuel),
                diameterRatio: 1.1,
                onSelectedItemChanged: (value) {
                  setState(
                    () {
                      selectedItemFuel = value;
                      ForecastResult.fuelName = fuelList[selectedItemFuel];
                      ForecastResult.fuel =
                          (selectedItemFuel.toInt() + 1).toString();
                    },
                  );
                },
                children: [
                  Text(fuelList[0]),
                  Text(fuelList[1]),
                  Text(fuelList[2]),
                  Text(fuelList[3]),
                  Text(fuelList[4]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showDrivePicker() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: CupertinoPicker(
                magnification: 1.1,
                squeeze: 1.45,
                itemExtent: 30,
                scrollController:
                    FixedExtentScrollController(initialItem: selectedItemDrive),
                diameterRatio: 1.1,
                onSelectedItemChanged: (value) {
                  setState(
                    () {
                      selectedItemDrive = value;
                      ForecastResult.driveName = driveList[selectedItemDrive];
                      ForecastResult.drive =
                          (selectedItemDrive.toInt() + 1).toString();
                    },
                  );
                },
                children: [
                  Text(driveList[0]),
                  Text(driveList[1]),
                  Text(driveList[2]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showSizePicker() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: CupertinoPicker(
                magnification: 1.1,
                squeeze: 1.45,
                itemExtent: 30,
                scrollController:
                    FixedExtentScrollController(initialItem: selectedItemSize),
                diameterRatio: 1.1,
                onSelectedItemChanged: (value) {
                  setState(
                    () {
                      selectedItemSize = value;
                      ForecastResult.sizeName = sizeList[selectedItemSize];
                      ForecastResult.size =
                          (selectedItemSize.toInt() + 1).toString();
                    },
                  );
                },
                children: [
                  Text(sizeList[0]),
                  Text(sizeList[1]),
                  Text(sizeList[2]),
                  Text(sizeList[3]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
} // End


// ----------------------------------------------------------------------------------------------------------------

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_project/model/forecast/forecast_message.dart';
// import 'package:flutter_project/view/forecast/result_screen.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DetailScreen extends StatefulWidget {
//   const DetailScreen({super.key});

//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   late TextEditingController odometerController;

//   late String cylindersName;
//   late String fuelName;
//   late String driveName;
//   late String sizeName;

//   late String year;
//   late String cylinders;
//   late String fuel;
//   late String odometer;
//   late String drive;
//   late String size;

//   String result = 'all';
//   late List yearList;
//   late List cylinderList;
//   late List fuelList;
//   late List driveList;
//   late List sizeList;

//   late int selectedItemYear;
//   late int selectedItemCylinders;
//   late int selectedItemFuel;
//   late int selectedItemDrive;
//   late int selectedItemSize;

//   @override
//   void initState() {
//     super.initState();
//     year = 'select year';
//     cylinders = '';
//     fuel = '';
//     drive = '';
//     size = '';
//     cylindersName = 'select cylinders';
//     fuelName = 'select fuel';
//     driveName = 'select drive';
//     sizeName = 'select size';
//     yearList = [
//       for (int i = 2000; i <= 2020; i++)
//         {
//           i,
//         },
//     ];
//     cylinderList = [
//       '3 cylinders',
//       '4 cylinders',
//       '5 cylinders',
//       '6 cylinders',
//       '8 cylinders',
//       '10 cylinders',
//       '12 cylinders',
//       'other',
//     ];
//     fuelList = [
//       'diesel',
//       'electric',
//       'gas',
//       'hybrid',
//       'other',
//     ];
//     driveList = [
//       '4wd',
//       'fwd',
//       'rwd',
//     ];
//     sizeList = [
//       'full-size',
//       'mid-size',
//       'compact',
//       'sub-compact',
//     ];
//     odometerController = TextEditingController();

//     selectedItemYear = 0;
//     selectedItemCylinders = 0;
//     selectedItemFuel = 0;
//     selectedItemDrive = 0;
//     selectedItemSize = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Row(
//                 children: const [Text('Year')],
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         setState(() {
//                           year = yearList[0].toString().substring(1, 5);
//                         });
//                         _showYearPicker();
//                       },
//                       child: Text(year)),
//                 ],
//               ),
//               Row(
//                 children: const [Text('Cylinder')],
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         setState(() {
//                           if (cylinders == '') {
//                             cylindersName = cylinderList[0];
//                             cylinders = '1';
//                           }
//                         });
//                         _showCylindersPicker();
//                       },
//                       child: Text(cylindersName)),
//                 ],
//               ),
//               Row(
//                 children: const [Text('Fuel')],
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         setState(() {
//                           if (fuel == '') {
//                             fuelName = fuelList[0];
//                             fuel = '1';
//                           }
//                         });
//                         _showFuelPicker();
//                       },
//                       child: Text(fuelName)),
//                 ],
//               ),
//               TextField(
//                 controller: odometerController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: 'odometer',
//                 ),
//               ),
//               Row(
//                 children: const [Text('Drive')],
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         setState(() {
//                           if (drive == '') {
//                             driveName = driveList[0];
//                             drive = '1';
//                           }
//                         });
//                         _showDrivePicker();
//                       },
//                       child: Text(driveName)),
//                 ],
//               ),
//               Row(
//                 children: const [Text('Size')],
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         setState(() {
//                           if (size == '') {
//                             sizeName = sizeList[0];
//                             size = '1';
//                           }
//                         });
//                         _showSizePicker();
//                       },
//                       child: Text(sizeName)),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   forecastAction();
//                 },
//                 child: const Text(
//                   '예측하기',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // --- Function ---
//   getJSONData() async {
//     var url = Uri.parse(
//         'http://localhost:8080/Rserve/rf_f150.jsp?year=$year&cylinders=$cylinders&fuel=$fuel&odometer=$odometer&drive=$drive&size=$size');
//     var response = await http.get(url);
//     setState(() {
//       var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
//       result = dataConvertedJSON['result'];
//     });
//     _showDialog(context, result);
//   }

//   _showDialog(BuildContext context, String result) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('입력 내용'),
//           content: Text(
//             '연식 : $year\n주행거리 : $odometer\n실린더 : $cylindersName\n연료 : $fuelName\n구동방식 : $driveName\n차량 사이즈 : $sizeName',
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text(
//                     '아니요',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     setState(
//                       () {
//                         ForecastResult.year = year;
//                         ForecastResult.odometer = odometer;
//                         ForecastResult.cylinders = cylindersName;
//                         ForecastResult.fuel = fuelName;
//                         ForecastResult.drive = driveName;
//                         ForecastResult.size = sizeName;
//                         ForecastResult.forecastResult = result;
//                       },
//                     );
//                     Navigator.of(context).pop();
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return const ResultScreen();
//                       },
//                     ));
//                   },
//                   child: const Text('네'),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // _showYearPicker(BuildContext context) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: const Text('Year'),
//   //         content:
//   //       );
//   //     },
//   //   );
//   // }

//   _showYearPicker() {
//     Get.bottomSheet(
//       Container(
//         height: 200,
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200,
//               height: 100,
//               child: CupertinoPicker(
//                 magnification: 1.1,
//                 squeeze: 1.45,
//                 itemExtent: 30,
//                 scrollController:
//                     FixedExtentScrollController(initialItem: selectedItemYear),
//                 diameterRatio: 1.1,
//                 onSelectedItemChanged: (value) {
//                   setState(
//                     () {
//                       selectedItemYear = value;
//                       year = '${yearList[selectedItemYear]}'.substring(1, 5);
//                     },
//                   );
//                 },
//                 children: [
//                   Text('${yearList[0]}'.substring(1, 5)),
//                   Text('${yearList[1]}'.substring(1, 5)),
//                   Text('${yearList[2]}'.substring(1, 5)),
//                   Text('${yearList[3]}'.substring(1, 5)),
//                   Text('${yearList[4]}'.substring(1, 5)),
//                   Text('${yearList[5]}'.substring(1, 5)),
//                   Text('${yearList[6]}'.substring(1, 5)),
//                   Text('${yearList[7]}'.substring(1, 5)),
//                   Text('${yearList[8]}'.substring(1, 5)),
//                   Text('${yearList[9]}'.substring(1, 5)),
//                   Text('${yearList[10]}'.substring(1, 5)),
//                   Text('${yearList[11]}'.substring(1, 5)),
//                   Text('${yearList[12]}'.substring(1, 5)),
//                   Text('${yearList[13]}'.substring(1, 5)),
//                   Text('${yearList[14]}'.substring(1, 5)),
//                   Text('${yearList[15]}'.substring(1, 5)),
//                   Text('${yearList[16]}'.substring(1, 5)),
//                   Text('${yearList[17]}'.substring(1, 5)),
//                   Text('${yearList[18]}'.substring(1, 5)),
//                   Text('${yearList[19]}'.substring(1, 5)),
//                   Text('${yearList[20]}'.substring(1, 5)),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('OK')),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _showCylindersPicker() {
//     Get.bottomSheet(
//       Container(
//         height: 200,
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200,
//               height: 100,
//               child: CupertinoPicker(
//                 magnification: 1.1,
//                 squeeze: 1.45,
//                 itemExtent: 30,
//                 scrollController: FixedExtentScrollController(
//                     initialItem: selectedItemCylinders),
//                 diameterRatio: 1.1,
//                 onSelectedItemChanged: (value) {
//                   setState(
//                     () {
//                       selectedItemCylinders = value;
//                       cylindersName = cylinderList[selectedItemCylinders];
//                       cylinders =
//                           (selectedItemCylinders.toInt() + 1).toString();
//                     },
//                   );
//                 },
//                 children: [
//                   Text(cylinderList[0]),
//                   Text(cylinderList[1]),
//                   Text(cylinderList[2]),
//                   Text(cylinderList[3]),
//                   Text(cylinderList[4]),
//                   Text(cylinderList[5]),
//                   Text(cylinderList[6]),
//                   Text(cylinderList[7]),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('OK')),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _showFuelPicker() {
//     Get.bottomSheet(
//       Container(
//         height: 200,
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200,
//               height: 100,
//               child: CupertinoPicker(
//                 magnification: 1.1,
//                 squeeze: 1.45,
//                 itemExtent: 30,
//                 scrollController:
//                     FixedExtentScrollController(initialItem: selectedItemFuel),
//                 diameterRatio: 1.1,
//                 onSelectedItemChanged: (value) {
//                   setState(
//                     () {
//                       selectedItemFuel = value;
//                       fuelName = fuelList[selectedItemFuel];
//                       fuel = (selectedItemFuel.toInt() + 1).toString();
//                     },
//                   );
//                 },
//                 children: [
//                   Text(fuelList[0]),
//                   Text(fuelList[1]),
//                   Text(fuelList[2]),
//                   Text(fuelList[3]),
//                   Text(fuelList[4]),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('OK')),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _showDrivePicker() {
//     Get.bottomSheet(
//       Container(
//         height: 200,
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200,
//               height: 100,
//               child: CupertinoPicker(
//                 magnification: 1.1,
//                 squeeze: 1.45,
//                 itemExtent: 30,
//                 scrollController:
//                     FixedExtentScrollController(initialItem: selectedItemDrive),
//                 diameterRatio: 1.1,
//                 onSelectedItemChanged: (value) {
//                   setState(
//                     () {
//                       selectedItemDrive = value;
//                       driveName = driveList[selectedItemDrive];
//                       drive = (selectedItemDrive.toInt() + 1).toString();
//                     },
//                   );
//                 },
//                 children: [
//                   Text(driveList[0]),
//                   Text(driveList[1]),
//                   Text(driveList[2]),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('OK')),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _showSizePicker() {
//     Get.bottomSheet(
//       Container(
//         height: 200,
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200,
//               height: 100,
//               child: CupertinoPicker(
//                 magnification: 1.1,
//                 squeeze: 1.45,
//                 itemExtent: 30,
//                 scrollController:
//                     FixedExtentScrollController(initialItem: selectedItemSize),
//                 diameterRatio: 1.1,
//                 onSelectedItemChanged: (value) {
//                   setState(
//                     () {
//                       selectedItemSize = value;
//                       sizeName = sizeList[selectedItemSize];
//                       size = (selectedItemSize.toInt() + 1).toString();
//                     },
//                   );
//                 },
//                 children: [
//                   Text(sizeList[0]),
//                   Text(sizeList[1]),
//                   Text(sizeList[2]),
//                   Text(sizeList[3]),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('OK')),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   forecastAction() {
//     odometer = odometerController.text;
//     if (year == 'select year' ||
//         cylinders == '' ||
//         fuel == '' ||
//         odometerController.text.isEmpty ||
//         drive == '' ||
//         size == '') {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           backgroundColor: Colors.red,
//           content: Text('모두 입력해주세요.'),
//           duration: Duration(seconds: 1),
//         ),
//       );
//     } else {
//       getJSONData();
//     }
//   }
// } // End