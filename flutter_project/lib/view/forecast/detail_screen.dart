import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/forecast/forecast_message.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController odometerController;

  String result = 'all';
  late List yearList;
  late List fuelList;
  late List transmissionList;
  late List driveList;

  late int selectedItemYear;
  late int selectedItemFuel;
  late int selectedItemTransmission;
  late int selectedItemDrive;

  @override
  void initState() {
    super.initState();

    yearList = [
      for (int i = 2000; i <= 2020; i++)
        {
          i,
        },
    ];
    transmissionList = [
      'automatic',
      'manual',
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
    odometerController = TextEditingController();

    selectedItemYear = 0;
    selectedItemFuel = 0;
    selectedItemTransmission = 0;
    selectedItemDrive = 0;
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
                Row(
                  children: const [Text('Transmission')],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (ForecastResult.transmission == '') {
                              ForecastResult.transmissionName =
                                  transmissionList[0];
                              ForecastResult.transmission = '1';
                            }
                          });
                          _showTransmissionPicker();
                        },
                        child: Text(ForecastResult.transmissionName)),
                  ],
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

  _showTransmissionPicker() {
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
                    initialItem: selectedItemTransmission),
                diameterRatio: 1.1,
                onSelectedItemChanged: (value) {
                  setState(
                    () {
                      selectedItemTransmission = value;
                      ForecastResult.transmissionName =
                          transmissionList[selectedItemTransmission];
                      ForecastResult.transmission =
                          (selectedItemTransmission.toInt() + 1).toString();
                    },
                  );
                },
                children: [
                  Text(transmissionList[0]),
                  Text(transmissionList[1]),
                  Text(transmissionList[2]),
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
} // End