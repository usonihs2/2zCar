import 'package:flutter_project/model/forecast/repository.dart';

import 'forecast_message.dart';

class ResetStatic {
  static resetStatic() {
    Repository.brandImage = "";
    Repository.brandName = "";
    Repository.modelImage = "";
    Repository.modelName = "";
    Repository.modelPath = "";
    ForecastResult.year = 'select year';
    ForecastResult.fuel = '';
    ForecastResult.odometer = '';
    ForecastResult.transmission = '';
    ForecastResult.drive = '';

    ForecastResult.fuelName = 'select fuel';
    ForecastResult.transmissionName = 'select transmission';
    ForecastResult.driveName = 'select drive';

    ForecastResult.forecastResult = '';
    ForecastResult.priceRange = '';
  }
}
