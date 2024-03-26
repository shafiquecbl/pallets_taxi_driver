import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.sharedPreferences});

  Future<bool> initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.THEME)) {
      sharedPreferences.setBool(AppConstants.THEME, false);
    }
    if (!sharedPreferences.containsKey(AppConstants.COUNTRY_CODE)) {
      sharedPreferences.setString(
          AppConstants.COUNTRY_CODE, AppConstants.languages[0].countryCode);
    }
    if (!sharedPreferences.containsKey(AppConstants.LANGUAGE_CODE)) {
      sharedPreferences.setString(
          AppConstants.LANGUAGE_CODE, AppConstants.languages[0].languageCode);
    }

    return Future.value(true);
  }
}
