// ignore_for_file: constant_identifier_names

import 'package:pallets_taxi_driver_pannel/data/model/language.dart';
import 'images.dart';

class AppConstants {
  static const String API_KEY = 'AIzaSyCS0Ne9nwgbvTl9Wvk373c5nEMX5LP418o';
  static const String APP_NAME = 'PalletTaxi';
  static const String BASE_URL = 'https://pallettaxi.dcodax.net/api';

  // endpoints
  static const String APP_SETTING = '/appsetting';

  // document
  static const String SUBMITTED_DOCUMENTS = '/driver-document-list';
  static const String SUBMIT_DOCUMENTS = '/driver-document-save';

  // auth
  static const String REGISTER_URI = '/driver-register';
  static const String LOGIN_URI = '/login';
  static const String TOKEN_URI = '/customer/cm-firebase-token';

  // profile
  static const String PROFILE_URI = '/user-detail';
  static const String UPDATE_PROFILE_URI = '/update-profile';

  // ride
  static const String CURRENT_RIDE_REQUEST = '/current-riderequest';
  static const String RIDE_REQUEST_RESPONSE = '/riderequest-respond';
  static const String RIDE_REQUEST_LIST = '/riderequest-list';
  static const String RIDE_REQUEST_UPDATE = '/riderequest-update';
  static const String SAVE_RIDE_RATING = '/save-ride-rating';
  static const String COMPLETE_RIDE_REQUEST = '/complete-riderequest';
  static const String SAVE_PAYMENT = '/save-payment';

  // earning
  static const String EARNING_URI = '/earning-list';

  // message
  static const String MESSAGE_URI = '/message/get';
  static const String SEND_MESSAGE_URI = '/message/send/driver';

  // location
  static const String UPDATE_DRIVER_LOCATION = '/update-user-status';

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
      imageUrl: Images.facebook,
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: Images.facebook,
      languageName: 'Arabic',
      countryCode: 'SA',
      languageCode: 'ar',
    ),
  ];
}
