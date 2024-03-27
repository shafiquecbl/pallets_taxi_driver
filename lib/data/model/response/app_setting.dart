class AppSetting {
  AppSettingClass appSetting;
  String? termsCondition;
  String? privacyPolicy;
  CurrencySetting currencySetting;

  AppSetting({
    required this.appSetting,
    this.termsCondition,
    this.privacyPolicy,
    required this.currencySetting,
  });

  factory AppSetting.fromJson(Map<String, dynamic> json) => AppSetting(
        appSetting: AppSettingClass.fromJson(json["app_setting"]),
        termsCondition: json["terms_condition"],
        privacyPolicy: json["privacy_policy"],
        currencySetting: CurrencySetting.fromJson(json["currency_setting"]),
      );

  Map<String, dynamic> toJson() => {
        "app_setting": appSetting.toJson(),
        "terms_condition": termsCondition,
        "privacy_policy": privacyPolicy,
        "currency_setting": currencySetting.toJson(),
      };
}

class AppSettingClass {
  int id;
  List<String> languageOption;
  String? contactEmail;
  String? contactNumber;
  String? helpSupportUrl;

  AppSettingClass({
    required this.id,
    required this.languageOption,
    this.contactEmail,
    this.contactNumber,
    this.helpSupportUrl,
  });

  factory AppSettingClass.fromJson(Map<String, dynamic> json) =>
      AppSettingClass(
        id: json["id"],
        languageOption:
            List<String>.from(json["language_option"].map((x) => x)),
        contactEmail: json["contact_email"],
        contactNumber: json["contact_number"],
        helpSupportUrl: json["help_support_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "language_option": List<dynamic>.from(languageOption.map((x) => x)),
        "contact_email": contactEmail,
        "contact_number": contactNumber,
        "help_support_url": helpSupportUrl,
      };
}

class CurrencySetting {
  String name;
  String symbol;
  String code;
  String position;

  CurrencySetting({
    required this.name,
    required this.symbol,
    required this.code,
    required this.position,
  });

  factory CurrencySetting.fromJson(Map<String, dynamic> json) =>
      CurrencySetting(
        name: json["name"],
        symbol: json["symbol"],
        code: json["code"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "code": code,
        "position": position,
      };
}
