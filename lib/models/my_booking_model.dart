class MyAppointmentModel {
  final String status;
  final String statusCode;
  final String message;
  final AppointmentListData data;

  MyAppointmentModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MyAppointmentModel.fromJson(Map<String, dynamic> json) {
    return MyAppointmentModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? '',
      message: json['message'] ?? '',
      data: AppointmentListData.fromJson(json['data'] ?? {}),
    );
  }
}

class AppointmentListData {
  final String type;
  final AppointmentListAttributes attributes;

  AppointmentListData({
    required this.type,
    required this.attributes,
  });

  factory AppointmentListData.fromJson(Map<String, dynamic> json) {
    return AppointmentListData(
      type: json['type'] ?? '',
      attributes: AppointmentListAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class AppointmentListAttributes {
  final List<Appointment> appointmentList;
  final Pagination pagination;

  AppointmentListAttributes({
    required this.appointmentList,
    required this.pagination,
  });

  factory AppointmentListAttributes.fromJson(Map<String, dynamic> json) {
    return AppointmentListAttributes(
      appointmentList: List<Appointment>.from(
          (json['appointmentList'] ?? []).map((x) => Appointment.fromJson(x))),
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
    );
  }
}

class Appointment {
  final String id;
  final User user;
  final Consultant consultant;
  final double amount;
  final String subject;
  final String description;
  final DateTime appointmentTime;
  final int duration;
  final String type;
  final String status;
  final String isAdminAccepted;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Appointment({
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
    required this.v,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      consultant: Consultant.fromJson(json['consultant'] ?? {}),
      amount: (json['amount'] ?? 0.0).toDouble(),
      subject: json['subject'] ?? '',
      description: json['description'] ?? '',
      appointmentTime: DateTime.parse(json['appointmentTime'] ?? DateTime.now().toIso8601String()),
      duration: json['duration'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      isAdminAccepted: json['isAdminAccepted'] ?? "",
      paymentStatus: json['paymentStatus'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      v: json['__v'] ?? 0,
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String countryCode;
  final String image;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryCode,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class Consultant {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String countryCode;
  final String image;
  final String title;

  Consultant({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryCode,
    required this.image,
    required this.title,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return Consultant(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '',
      title: json['title'] ?? '',
    );
  }
}

class Pagination {
  final int totalResults;
  final int totalPages;
  final int currentPage;
  final int limit;

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
