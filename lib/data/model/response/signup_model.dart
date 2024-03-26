class SignUpModel {
  String name;
  String phone;
  String email;
  String password;

  SignUpModel({
    required this.name,
    required this.phone,
    this.email = '',
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      };
}
