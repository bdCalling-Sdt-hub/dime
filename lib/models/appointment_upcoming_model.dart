class AppointmentsUpcomingModel {
  final String status;
  final String statusCode;
  final String message;
  final AppointmentData data;

  AppointmentsUpcomingModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AppointmentsUpcomingModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsUpcomingModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 200.toString(),
      message: json['message'] ?? 'appointments-list',
      data: AppointmentData.fromJson(json['data'] ?? {}),
    );
  }
}

class AppointmentData {
  final String type;
  final AppointmentAttributes attributes;

  AppointmentData({
    required this.type,
    required this.attributes,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      type: json['type'] ?? 'appointment',
      attributes: AppointmentAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class AppointmentAttributes {
  final List<Appointment> appointmentList;
  final Pagination pagination;

  AppointmentAttributes({
    required this.appointmentList,
    required this.pagination,
  });

  factory AppointmentAttributes.fromJson(Map<String, dynamic> json) {
    var list = json['appointmentList'] as List? ?? [];
    List<Appointment> appointmentList =
        list.map((i) => Appointment.fromJson(i)).toList();

    return AppointmentAttributes(
      appointmentList: appointmentList,
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
    );
  }
}

class Appointment {
  final String id;
  final User user;
  final Consultant consultant;
  final int amount;
  final String subject;
  final String description;
  final int duration;
  final String type;
  final String link;
  final String status;
  final String isAdminAccepted;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime appointmentTime; // Optional field

  Appointment({
    required this.id,
    required this.user,
    required this.consultant,
    required this.amount,
    required this.subject,
    required this.description,
    required this.duration,
    required this.type,
    required this.link,
    required this.status,
    required this.isAdminAccepted,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.appointmentTime,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      consultant: Consultant.fromJson(json['consultant'] ?? {}),
      amount: json['amount'] ?? 0,
      subject: json['subject'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? 0,
      type: json['type'] ?? 'unknown',
      link: json['link'] ?? '',
      status: json['status'] ?? 'unknown',
      isAdminAccepted: json['isAdminAccepted'] ?? 'unknown',
      paymentStatus: json['paymentStatus'] ?? 'unknown',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      appointmentTime: json['appointmentTime'] != null
          ? DateTime.tryParse(json['appointmentTime']) ?? DateTime.now()
          : DateTime.now(),
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
      fullName: json['fullName'] ?? 'Unknown',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '/uploads/users/default.png',
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
      fullName: json['fullName'] ?? 'Unknown',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      image: json['image'] ?? '/uploads/users/default.png',
      title: json['title'] ?? 'Consultant',
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
      totalPages: json['totalPages'] ?? 1,
      currentPage: json['currentPage'] ?? 1,
      limit: json['limit'] ?? 10,
    );
  }
}
