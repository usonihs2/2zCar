import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  //firebase
  final String brand;
  final Timestamp date;
  final String drive;
  final String fuel;
  final String model;
  final String odometer;
  final String priceRange;
  final String transmission;
  final String userId;
  final String year;

  Record(
      {required this.brand,
      required this.date,
      required this.drive,
      required this.fuel,
      required this.model,
      required this.odometer,
      required this.priceRange,
      required this.transmission,
      required this.userId,
      required this.year});
}
