class AppSetting {
  AppSettingClass appSetting;
  String? termsCondition;
  String? privacyPolicy;
  String? aboutUs;
  String? faq;
  CurrencySetting currencySetting;
  List<String> weight;
  List<String> equipments;
  List<String> dimensions;

  AppSetting({
    required this.appSetting,
    this.termsCondition,
    this.privacyPolicy,
    this.aboutUs,
    this.faq,
    required this.currencySetting,
    required this.weight,
    required this.equipments,
    required this.dimensions,
  });

  factory AppSetting.fromJson(Map<String, dynamic> json) => AppSetting(
        appSetting: AppSettingClass.fromJson(json["app_setting"]),
        termsCondition: json["terms_condition"] is String
            ? json["terms_condition"]
            : json["terms_condition"]["value"],
        privacyPolicy: json["privacy_policy"] is String
            ? json["privacy_policy"]
            : json["privacy_policy"]["value"],
        aboutUs: json["about_us"],
        faq: json["faq"],
        currencySetting: CurrencySetting.fromJson(json["currency_setting"]),
        weight: List<String>.from(json["weight"].map((x) => x)),
        equipments: List<String>.from(json["equipments"].map((x) => x)),
        dimensions: List<String>.from(json["dimensions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "app_setting": appSetting.toJson(),
        "terms_condition": termsCondition,
        "privacy_policy": privacyPolicy,
        "about_us": aboutUs,
        "faq": faq,
        "currency_setting": currencySetting.toJson(),
        "weight": List<dynamic>.from(weight.map((x) => x)),
        "equipments": List<dynamic>.from(equipments.map((x) => x)),
        "dimensions": List<dynamic>.from(dimensions.map((x) => x)),
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
