class ReviewModel {
  String status;
  String statusCode;
  String message;
  Data data;

  ReviewModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
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
  String averageRatings;
  int totalReviews;
  int fiveStarReviews;
  int fourStarReviews;
  int threeStarReviews;
  int twoStarReviews;
  int oneStarReviews;

  Attributes({
    required this.averageRatings,
    required this.totalReviews,
    required this.fiveStarReviews,
    required this.fourStarReviews,
    required this.threeStarReviews,
    required this.twoStarReviews,
    required this.oneStarReviews,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      averageRatings: json['averageRatings'] ?? '0.00',
      totalReviews: json['totalReviews'] ?? 0,
      fiveStarReviews: json['fiveStarReviews'] ?? 0,
      fourStarReviews: json['fourStarReviews'] ?? 0,
      threeStarReviews: json['threeStarReviews'] ?? 0,
      twoStarReviews: json['twoStarReviews'] ?? 0,
      oneStarReviews: json['oneStarReviews'] ?? 0,
    );
  }
}
