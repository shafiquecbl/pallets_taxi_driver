// ignore_for_file: constant_identifier_names

import 'package:pallets_taxi_driver_pannel/data/model/language.dart';

import 'images.dart';

class AppConstants {
  //
  static const String APP_NAME = 'Umash';
  static const String CONFIG = '/api/config';

  // Shared Key
  static const String THEME = 'theme';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String TOPIC = 'notify';
  static const String TOKEN = 'token';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_EMAIL = 'user_email';
  static const String LOCALIZATION_KEY = 'X-localization';

  // Language
  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: Images.facebook_icon,
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: Images.facebook_icon,
      languageName: 'Arabic',
      countryCode: 'SA',
      languageCode: 'ar',
    ),
  ];
}
