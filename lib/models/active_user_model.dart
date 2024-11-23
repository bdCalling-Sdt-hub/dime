class ActiveUserModel {
  String userFullName;
  String id;
  String email;
  String image;
  String role;
  int iat;
  int exp;

  ActiveUserModel({
    required this.userFullName,
    required this.id,
    required this.email,
    required this.role,
    required this.image,
    required this.iat,
    required this.exp,
  });

  factory ActiveUserModel.fromJson(Map<String, dynamic> json) {
    return ActiveUserModel(
      userFullName: json['userFullName'] ?? '',
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      role: json['role'] ?? 'user',
      iat: json['iat'] ?? 0,
      exp: json['exp'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'userFullName': userFullName,
      '_id': id,
      'email': email,
      'role': role,
      'iat': iat,
      'exp': exp,
    };
    return data;
  }
}
