class UserResponseModel {
  int? id;
  String? email;
  String? username;
  String? password;
  Map<String, dynamic>? name;
  Map<String, dynamic>? address;
  String? phone;

  UserResponseModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> data) {
    return UserResponseModel(
      id: data['id'] ?? 0,
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      password: data['password'] ?? '',
      name: data['name'] ?? {},
      address: data['address'] ?? {},
      phone: data['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "password": password,
      "name": name,
      "address": address,
      "phone": phone,
    };
  }
}
