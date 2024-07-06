class RecentTransactionModel {
  String status;
  String statusCode;
  String message;
  WithdrawRequestData data;

  RecentTransactionModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory RecentTransactionModel.fromJson(Map<String, dynamic> json) {
    return RecentTransactionModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? '',
      message: json['message'] ?? '',
      data: WithdrawRequestData.fromJson(json['data'] ?? {}),
    );
  }
}

class WithdrawRequestData {
  String type;
  WithdrawRequestAttributes attributes;

  WithdrawRequestData({
    required this.type,
    required this.attributes,
  });

  factory WithdrawRequestData.fromJson(Map<String, dynamic> json) {
    return WithdrawRequestData(
      type: json['type'] ?? '',
      attributes: WithdrawRequestAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class WithdrawRequestAttributes {
  List<WithdrawRequest> withdrawRequests;
  Pagination pagination;

  WithdrawRequestAttributes({
    required this.withdrawRequests,
    required this.pagination,
  });

  factory WithdrawRequestAttributes.fromJson(Map<String, dynamic> json) {
    var withdrawRequestsList = json['WithdrawRequests'] as List<dynamic>? ?? [];
    List<WithdrawRequest> requests = withdrawRequestsList
        .map((data) => WithdrawRequest.fromJson(data))
        .toList();

    return WithdrawRequestAttributes(
      withdrawRequests: requests,
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
    );
  }
}

class WithdrawRequest {
  BankInfo bankInfo;
  String id;
  User user;
  double amount;
  String status;
  String paymentGateway;
  DateTime createdAt;
  DateTime updatedAt;

  WithdrawRequest({
    required this.bankInfo,
    required this.id,
    required this.user,
    required this.amount,
    required this.status,
    required this.paymentGateway,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) {
    return WithdrawRequest(
      bankInfo: BankInfo.fromJson(json['bankInfo'] ?? {}),
      id: json['_id'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      amount: (json['amount'] ?? 0.0).toDouble(),
      status: json['status'] ?? '',
      paymentGateway: json['paymentGateway'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
    );
  }
}

class BankInfo {
  String bankName;
  String accountNumber;
  String accountName;
  String accountType;
  String cedulaNumber;

  BankInfo({
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.accountType,
    required this.cedulaNumber,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) {
    return BankInfo(
      bankName: json['bankName'] ?? '',
      accountNumber: json['accountNumber'] ?? '',
      accountName: json['accountName'] ?? '',
      accountType: json['accountType'] ?? '',
      cedulaNumber: json['cedulaNumber'] ?? '',
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
  List<dynamic> category;
  int consultationCompleted;
  int ratings;
  double averageResponseTime;
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
      category: json['category'] ?? [],
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: json['ratings'] ?? 0,
      averageResponseTime: (json['averageResponseTime'] ?? 0.0).toDouble(),
      adminApproval: json['adminApproval'] ?? '',
      availability: json['availability'] ?? [],
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
    );
  }
}

class Pagination {
  int currentPage;
  int limit;
  int totalResults;
  int totalPages;

  Pagination({
    required this.currentPage,
    required this.limit,
    required this.totalResults,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'] ?? 0,
      limit: json['limit'] ?? 0,
      totalResults: json['totalResults'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
    );
  }
}
