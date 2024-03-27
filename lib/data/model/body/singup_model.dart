class SignUpModel {
  String name;
  String email;
  String password;
  String phoneNumber;
  String vehicleNumber;
  bool dotMc;
  bool commercialAuto;
  String? fcmToken;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.vehicleNumber,
    required this.dotMc,
    required this.commercialAuto,
    this.fcmToken,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['contact_number'],
      vehicleNumber: json['vehicleNumber'],
      dotMc: json['dotMc'],
      commercialAuto: json['commercialAuto'],
    );
  }

  Map<String, dynamic> toJson() {
    List<String> splitName = name.split(' ');
    String firstName = splitName.first;
    String lastName = splitName.skip(1).join(' ');
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'contact_number': phoneNumber,
      'vehicleNumber': vehicleNumber,
      'dotMc': dotMc,
      'commercialAuto': commercialAuto,
      'fcm_token': fcmToken,
    };
  }

  SignUpModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? vehicleNumber,
    bool? dotMc,
    bool? commercialAuto,
    String? deviceToken,
  }) {
    return SignUpModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      dotMc: dotMc ?? this.dotMc,
      commercialAuto: commercialAuto ?? this.commercialAuto,
      fcmToken: deviceToken ?? fcmToken,
    );
  }
}
