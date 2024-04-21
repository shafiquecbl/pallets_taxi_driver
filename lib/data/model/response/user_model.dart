class UserModel {
  int id;
  String name;
  String email;
  String phoneNumber;
  bool dotMc;
  bool commercialAuto;
  double? latitude;
  double? longitude;
  bool isOnline;
  bool isVerifiedDriver;
  bool isDocumentRequired;
  String image;
  String token;
  String status;
  num? totalTrips;
  num? earnings;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.dotMc,
    required this.commercialAuto,
    this.latitude,
    this.longitude,
    this.isOnline = false,
    this.isVerifiedDriver = false,
    this.isDocumentRequired = false,
    this.image = '',
    this.token = '',
    required this.status,
    this.totalTrips,
    this.earnings,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['display_name'],
      email: json['email'],
      phoneNumber: json['contact_number'],
      dotMc: false,
      commercialAuto: false,
      latitude: json['latitude'] != null
          ? double.parse(json['latitude'].toString())
          : json['latitude'],
      longitude: json['longitude'] != null
          ? double.parse(json['longitude'].toString())
          : json['longitude'],
      isOnline: json['is_online'] == 1 ? true : false,
      isVerifiedDriver: json['is_verified_driver'] == 1 ? true : false,
      isDocumentRequired: json['is_document_required'] == 1 ? true : false,
      image: json['profile_image'],
      token: json['api_token'] ?? '',
      status: json['status'],
      totalTrips: json['total_trips'],
      earnings: json['earnings'],
    );
  }

  Map<String, dynamic> toJson() {
    List<String> splitName = name.split(' ');
    String firstName = splitName.first;
    String lastName = splitName.skip(1).join(' ');
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'contact_number': phoneNumber,
      'dotMc': dotMc,
      'commercialAuto': commercialAuto,
      'latitude': latitude,
      'longitude': longitude,
      'is_online': isOnline,
      'is_verified_driver': isVerifiedDriver,
      'is_document_required': isDocumentRequired,
      'profile_image': image,
      'token': token,
      'status': status,
      'total_trips': totalTrips,
      'earnings': earnings,
    };
  }
}
