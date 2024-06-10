class Availability {
  List<String> day;
  String startTime;
  String endTime;

  Availability({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      day: List<String>.from(json['day'] ?? []),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}

class Category {
  String id;
  String name;
  String key;
  String image;
  num v;

  Category({
    required this.id,
    required this.name,
    required this.key,
    required this.image,
    required this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      key: json['key'] ?? '',
      image: json['image'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'key': key,
      'image': image,
      '__v': v,
    };
  }
}

class ConsultantListModel {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String countryCode;
  String image;
  String password;
  String role;
  num consultationCompleted;
  num ratings;
  num averageResponseTime;
  String createdAt;
  String updatedAt;
  num v;
  String aboutMe;
  Availability availability;
  List<Category> category;
  String gender;
  String title;
  num videoConferenceFee;
  num videoReplyFee;

  ConsultantListModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryCode,
    required this.image,
    required this.password,
    required this.role,
    required this.consultationCompleted,
    required this.ratings,
    required this.averageResponseTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.aboutMe,
    required this.availability,
    required this.category,
    required this.gender,
    required this.title,
    required this.videoConferenceFee,
    required this.videoReplyFee,
  });

  factory ConsultantListModel.fromJson(Map<String, dynamic> json) {
    return ConsultantListModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: json['ratings'] ?? 0,
      averageResponseTime: json['averageResponseTime'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      aboutMe: json['aboutMe'] ?? '',
      availability: Availability.fromJson(json['availability'] ?? {}),
      category: (json['category'] as List<dynamic>?)
          ?.map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
      gender: json['gender'] ?? '',
      title: json['title'] ?? '',
      videoConferenceFee: json['videoConferenceFee'] ?? 0,
      videoReplyFee: json['videoReplyFee'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'image': image,
      'password': password,
      'role': role,
      'consultationCompleted': consultationCompleted,
      'ratings': ratings,
      'averageResponseTime': averageResponseTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'aboutMe': aboutMe,
      'availability': availability.toJson(),
      'category': category.map((item) => item.toJson()).toList(),
      'gender': gender,
      'title': title,
      'videoConferenceFee': videoConferenceFee,
      'videoReplyFee': videoReplyFee,
    };
  }
}
