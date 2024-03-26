class VendorModel {
  int id;
  String name;
  String phone;
  String email;
  String address;
  double lat;
  double lng;
  String logo;
  String cover;
  List<String> permissions;

  VendorModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.lat,
    required this.lng,
    required this.logo,
    required this.cover,
    required this.permissions,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        id: json['id'],
        name: json['name'],
        phone: json['phoneNumber'],
        email: json['email'],
        address: json['address'],
        lat: double.parse(json['lat'].toString()),
        lng: double.parse(json['lng'].toString()),
        logo: json['logo'],
        cover: json['cover'],
        permissions: List<String>.from(json['permissions'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phone,
        'email': email,
        'address': address,
        'lat': lat,
        'lng': lng,
        'logo': logo,
        'cover': cover,
        'permissions': List<dynamic>.from(permissions.map((x) => x)),
      };
}
