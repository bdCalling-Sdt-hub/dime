class ConsultantProfileModel {
  String status;
  String statusCode;
  String message;
  ConsultantProfileData data;

  ConsultantProfileModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ConsultantProfileModel.fromJson(Map<String, dynamic> json) {
    return ConsultantProfileModel(
      status: json['status'] ?? 'Unknown',
      statusCode: json['statusCode'] ?? 'Unknown',
      message: json['message'] ?? 'No message',
      data: ConsultantProfileData.fromJson(json['data'] ?? {}),
    );
  }
}

class ConsultantProfileData {
  ConsultantAttributes attributes;

  ConsultantProfileData({
    required this.attributes,
  });

  factory ConsultantProfileData.fromJson(Map<String, dynamic> json) {
    return ConsultantProfileData(
      attributes: ConsultantAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class ConsultantAttributes {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String countryCode;
  String image;
  String password;
  String role;
  List<Category> category;
  int consultationCompleted;
  double ratings;
  int averageResponseTime;
  String adminApproval;
  List<Availability> availability;
  String createdAt;
  String updatedAt;
  int v;
  String aboutMe;
  String country;
  String gender;
  String title;
  int videoConferenceFee;
  int videoReplyFee;

  ConsultantAttributes({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryCode,
    required this.image,
    required this.password,
    required this.role,
    required this.category,
    required this.consultationCompleted,
    required this.ratings,
    required this.averageResponseTime,
    required this.adminApproval,
    required this.availability,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.aboutMe,
    required this.country,
    required this.gender,
    required this.title,
    required this.videoConferenceFee,
    required this.videoReplyFee,
  });

  factory ConsultantAttributes.fromJson(Map<String, dynamic> json) {
    var categoryList = json['category'] as List<dynamic>? ?? [];
    List<Category> categories = categoryList.map((category) => Category.fromJson(category)).toList();

    var availabilityList = json['availability'] as List<dynamic>? ?? [];
    List<Availability> availabilities = availabilityList.map((availability) => Availability.fromJson(availability)).toList();

    return ConsultantAttributes(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      category: categories,
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: (json['ratings'] ?? 0).toDouble(),
      averageResponseTime: json['averageResponseTime'] ?? 0,
      adminApproval: json['adminApproval'] ?? 'Pending',
      availability: availabilities,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      aboutMe: json['aboutMe'] ?? '',
      country: json['country'] ?? '',
      gender: json['gender'] ?? '',
      title: json['title'] ?? '',
      videoConferenceFee: json['videoConferenceFee'] ?? 0,
      videoReplyFee: json['videoReplyFee'] ?? 0,
    );
  }
}

class Category {
  String id;
  String name;
  String key;
  String image;
  int v;

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
}

class Availability {
  String day;
  String startTime;
  String endTime;
  String id;

  Availability({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.id,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      day: json['day'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      id: json['_id'] ?? '',
    );
  }
}
