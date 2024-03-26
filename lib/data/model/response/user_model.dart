class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String token;
  String? dob;
  String? bloodGroup;
  String? emergencyContact;
  String? medicalCondition;
  String? bikeType;
  String? milage;
  String? image;
  bool verified;
  bool premium;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.token,
    this.dob,
    this.bloodGroup,
    this.emergencyContact,
    this.medicalCondition,
    this.bikeType,
    this.milage,
    this.image,
    required this.verified,
    this.premium = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        phone: json['phoneNumber'],
        email: json['email'],
        token: json['auth_token'],
        dob: json['dob'],
        bloodGroup: json['blood'],
        emergencyContact: json['emergencyContact'],
        medicalCondition: json['medicalCondition'],
        bikeType: json['bikeType'],
        milage: json['mileage'],
        image: json['profile_image'],
        verified:
            (json['status'] == null || json['status'] == 0) ? false : true,
        premium: (json['isPremium'] == null || json['isPremium'] == 0)
            ? false
            : true,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phone,
        'email': email,
        'auth_token': token,
        'dob': dob,
        'blood': bloodGroup,
        'emergencyContact': emergencyContact,
        'medicalCondition': medicalCondition,
        'bikeType': bikeType,
        'mileage': milage,
        'profile_image': image,
        'status': verified,
        'isPremium': premium,
      };

  UserModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? token,
    String? dob,
    String? bloodGroup,
    String? emergencyContact,
    String? medicalCondition,
    String? bikeType,
    String? milage,
    String? image,
    bool? verified,
    bool? premium,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      token: token ?? this.token,
      dob: dob ?? this.dob,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      medicalCondition: medicalCondition ?? this.medicalCondition,
      bikeType: bikeType ?? this.bikeType,
      milage: milage ?? this.milage,
      image: image ?? this.image,
      verified: verified ?? this.verified,
      premium: premium ?? this.premium,
    );
  }
}
