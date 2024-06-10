class BlogsModel {
  String status;
  String statusCode;
  String message;
  Data data;

  BlogsModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory BlogsModel.fromJson(Map<String, dynamic> json) {
    return BlogsModel(
      status: json['status'] ?? 'Unknown',
      statusCode: json['statusCode'] ?? '000',
      message: json['message'] ?? 'No message',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  String type;
  Attributes attributes;

  Data({
    required this.type,
    required this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      type: json['type'] ?? 'Unknown',
      attributes: Attributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class Attributes {
  List<Blog> blogsList;
  Pagination pagination;

  Attributes({
    required this.blogsList,
    required this.pagination,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      blogsList: (json['blogsList'] ?? []).map<Blog>((x) => Blog.fromJson(x)).toList(),
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
    );
  }
}

class Blog {
  String id;
  String image;
  String title;
  String category;
  int price;
  String details;
  List<User> user;
  String createdAt;
  String updatedAt;
  int v;
  bool isPaymentDone;

  Blog({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.details,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isPaymentDone,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['_id'] ?? '',
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? 0,
      details: json['details'] ?? '',
      user: (json['user'] ?? []).map<User>((x) => User.fromJson(x)).toList(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      isPaymentDone: json['isPaymentDone'] ?? false,
    );
  }
}

class User {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String countryCode;
  String image;
  String password;
  String role;
  Availability availability;
  int consultationCompleted;
  int ratings;
  int averageResponseTime;
  String createdAt;
  String updatedAt;
  int v;
  String aboutMe;
  List<String> category;
  String gender;
  String title;
  int videoConferenceFee;
  int videoReplyFee;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryCode,
    required this.image,
    required this.password,
    required this.role,
    required this.availability,
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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      availability: Availability.fromJson(json['availability'] ?? {}),
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: json['ratings'] ?? 0,
      averageResponseTime: json['averageResponseTime'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      aboutMe: json['aboutMe'] ?? '',
      category: (json['category'] ?? []).map<String>((x) => x.toString()).toList(),
      gender: json['gender'] ?? '',
      title: json['title'] ?? '',
      videoConferenceFee: json['videoConferenceFee'] ?? 0,
      videoReplyFee: json['videoReplyFee'] ?? 0,
    );
  }
}

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
      day: (json['day'] ?? []).map<String>((x) => x.toString()).toList(),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
    );
  }
}

class Pagination {
  int totalResults;
  int totalPages;
  int currentPage;
  int limit;

  Pagination({
    required this.totalResults,
    required this.totalPages,
    required this.currentPage,
    required this.limit,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      totalResults: json['totalResults'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['currentPage'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }
}
