class AppointmentDetails {
  String status;
  String statusCode;
  String message;
  Data data;

  AppointmentDetails({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) {
    return AppointmentDetails(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? "",
      message: json['message'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data.toJson(),
    };
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
      type: json['type'] ?? '',
      attributes: Attributes.fromJson(json['attributes'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes.toJson(),
    };
  }
}

class Attributes {
  String id;
  User user;
  Consultant consultant;
  int amount;
  String subject;
  String description;
  DateTime appointmentTime;
  int duration;
  String type;
  String status;
  String isAdminAccepted;
  String paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;

  Attributes({
    required this.id,
    required this.user,
    required this.consultant,
    required this.amount,
    required this.subject,
    required this.description,
    required this.appointmentTime,
    required this.duration,
    required this.type,
    required this.status,
    required this.isAdminAccepted,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      id: json['_id'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      consultant: Consultant.fromJson(json['consultant'] ?? {}),
      amount: json['amount'] ?? 0,
      subject: json['subject'] ?? '',
      description: json['description'] ?? '',
      appointmentTime: DateTime.parse(json['appointmentTime'] ?? DateTime.now().toIso8601String()),
      duration: json['duration'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      isAdminAccepted: json['isAdminAccepted'] ?? '',
      paymentStatus: json['paymentStatus'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user.toJson(),
      'consultant': consultant.toJson(),
      'amount': amount,
      'subject': subject,
      'description': description,
      'appointmentTime': appointmentTime.toIso8601String(),
      'duration': duration,
      'type': type,
      'status': status,
      'isAdminAccepted': isAdminAccepted,
      'paymentStatus': paymentStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
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
  List<dynamic> category;
  int consultationCompleted;
  int ratings;
  int averageResponseTime;
  String adminApproval;
  List<dynamic> availability;
  DateTime createdAt;
  DateTime updatedAt;

  User({
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
      category: List<dynamic>.from(json['category'] ?? []),
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: json['ratings'] ?? 0,
      averageResponseTime: json['averageResponseTime'] ?? 0,
      adminApproval: json['adminApproval'] ?? '',
      availability: List<dynamic>.from(json['availability'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
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
      'category': category,
      'consultationCompleted': consultationCompleted,
      'ratings': ratings,
      'averageResponseTime': averageResponseTime,
      'adminApproval': adminApproval,
      'availability': availability,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Consultant {
  String id;
  String title;
  String fullName;
  String email;
  String phoneNumber;
  String countryCode;
  DateTime dateOfBirth;
  String country;
  String gender;
  String aboutMe;
  String image;
  int videoConferenceFee;
  int videoReplyFee;
  String password;
  String role;
  List<String> category;
  int consultationCompleted;
  double ratings;
  int averageResponseTime;
  String adminApproval;
  DateTime createdAt;
  DateTime updatedAt;

  Consultant({
    required this.id,
    required this.title,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryCode,
    required this.dateOfBirth,
    required this.country,
    required this.gender,
    required this.aboutMe,
    required this.image,
    required this.videoConferenceFee,
    required this.videoReplyFee,
    required this.password,
    required this.role,
    required this.category,
    required this.consultationCompleted,
    required this.ratings,
    required this.averageResponseTime,
    required this.adminApproval,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return Consultant(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      dateOfBirth: DateTime.parse(json['dateOfBirth'] ?? DateTime.now().toIso8601String()),
      country: json['country'] ?? '',
      gender: json['gender'] ?? '',
      aboutMe: json['aboutMe'] ?? '',
      image: json['image'] ?? '',
      videoConferenceFee: json['videoConferenceFee'] ?? 0,
      videoReplyFee: json['videoReplyFee'] ?? 0,
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      category: List<String>.from(json['category'] ?? []),
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: json['ratings']?.toDouble() ?? 0.0,
      averageResponseTime: json['averageResponseTime'] ?? 0,
      adminApproval: json['adminApproval'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'country': country,
      'gender': gender,
      'aboutMe': aboutMe,
      'image': image,
      'videoConferenceFee': videoConferenceFee,
      'videoReplyFee': videoReplyFee,
      'password': password,
      'role': role,
      'category': category,
      'consultationCompleted': consultationCompleted,
      'ratings': ratings,
      'averageResponseTime': averageResponseTime,
      'adminApproval': adminApproval,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'id': id,
    };
  }
}
