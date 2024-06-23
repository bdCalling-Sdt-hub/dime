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
  List<String> availabilityDay;
  String startTime;
  String endTime;
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String countryCode;
  String image;
  String password;
  String role;
  int consultationCompleted;
  double ratings;
  int averageResponseTime;
  String createdAt;
  String updatedAt;
  int v;
  String aboutMe;
  List<Category> category;
  String gender;
  String title;
  int videoConferenceFee;
  int videoReplyFee;
  String country;
  String adminApproval;

  ConsultantAttributes({
    required this.availabilityDay,
    required this.startTime,
    required this.endTime,
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
    required this.category,
    required this.gender,
    required this.title,
    required this.videoConferenceFee,
    required this.videoReplyFee,
    required this.country,
    required this.adminApproval,
  });

  factory ConsultantAttributes.fromJson(Map<String, dynamic> json) {
    var categoryList = json['category'] ?? [];
    List<Category> categories = [];

    for (var category in categoryList) {
      categories.add(Category.fromJson(category));
    }

    var availability = json['availability'] ?? {};
    return ConsultantAttributes(
      availabilityDay: List<String>.from(availability['day'] ?? []),
      startTime: availability['startTime'] ?? '',
      endTime: availability['endTime'] ?? '',
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: json['ratings']?.toDouble() ?? 0.0,
      averageResponseTime: json['averageResponseTime'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      aboutMe: json['aboutMe'] ?? '',
      category: categories,
      gender: json['gender'] ?? '',
      title: json['title'] ?? '',
      videoConferenceFee: json['videoConferenceFee'] ?? 0,
      videoReplyFee: json['videoReplyFee'] ?? 0,
      country: json['country'] ?? '',
      adminApproval: json['adminApproval'] ?? '',
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
