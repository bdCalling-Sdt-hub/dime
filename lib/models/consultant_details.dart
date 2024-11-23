class ConsultantDetailsModel {
  Consultant consultant;
  Review review;

  ConsultantDetailsModel({
    required this.consultant,
    required this.review,
  });

  factory ConsultantDetailsModel.fromJson(Map<String, dynamic> json) {
    return ConsultantDetailsModel(
      consultant: Consultant.fromJson(json['consultant'] ?? {}),
      review: Review.fromJson(json['review'] ?? {}),
    );
  }
}

class Availability {
  String day;
  String startTime;
  String endTime;

  Availability({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      day: json['day'] ?? '',
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

class Consultant {
  String id;
  String title;
  String fullName;
  String email;
  String phoneNumber;
  String countryCode;
  String dateOfBirth;
  String country;
  String gender;
  String aboutMe;
  String image;
  int videoConferenceFee;
  int videoReplyFee;
  String password;
  String role;
  List<Availability> availability;
  List<Category> category;
  int consultationCompleted;
  double ratings;
  int averageResponseTime;
  String adminApproval;
  int v;
  String createdAt;
  String updatedAt;

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
    required this.availability,
    required this.category,
    required this.consultationCompleted,
    required this.ratings,
    required this.averageResponseTime,
    required this.adminApproval,
    required this.v,
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
      dateOfBirth: json['dateOfBirth'] ?? '',
      country: json['country'] ?? '',
      gender: json['gender'] ?? '',
      aboutMe: json['aboutMe'] ?? '',
      image: json['image'] ?? '',
      videoConferenceFee: json['videoConferenceFee'] ?? 0,
      videoReplyFee: json['videoReplyFee'] ?? 0,
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      availability: (json['availability'] as List<dynamic>?)
              ?.map(
                  (item) => Availability.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      category: (json['category'] as List<dynamic>?)
              ?.map((item) => Category.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      consultationCompleted: json['consultationCompleted'] ?? 0,
      ratings: (json['ratings'] ?? 0).toDouble(),
      averageResponseTime: json['averageResponseTime'] ?? 0,
      adminApproval: json['adminApproval'] ?? '',
      v: json['__v'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
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
      'dateOfBirth': dateOfBirth,
      'country': country,
      'gender': gender,
      'aboutMe': aboutMe,
      'image': image,
      'videoConferenceFee': videoConferenceFee,
      'videoReplyFee': videoReplyFee,
      'password': password,
      'role': role,
      'availability': availability.map((item) => item.toJson()).toList(),
      'category': category.map((item) => item.toJson()).toList(),
      'consultationCompleted': consultationCompleted,
      'ratings': ratings,
      'averageResponseTime': averageResponseTime,
      'adminApproval': adminApproval,
      '__v': v,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class User {
  String id;
  String fullName;
  String image;

  User({
    required this.id,
    required this.fullName,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'image': image,
    };
  }
}

class TopReview {
  String id;
  User user;
  String consultant;
  String comment;
  int rating;
  String createdAt;
  String updatedAt;
  int v;

  TopReview({
    required this.id,
    required this.user,
    required this.consultant,
    required this.comment,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TopReview.fromJson(Map<String, dynamic> json) {
    return TopReview(
      id: json['_id'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      consultant: json['consultant'] ?? '',
      comment: json['comment'] ?? '',
      rating: json['rating'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user.toJson(),
      'consultant': consultant,
      'comment': comment,
      'rating': rating,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class Ratings {
  String averageRatings;
  int totalReviews;
  int fiveStarReviews;
  int fourStarReviews;
  int threeStarReviews;
  int twoStarReviews;
  int oneStarReviews;

  Ratings({
    required this.averageRatings,
    required this.totalReviews,
    required this.fiveStarReviews,
    required this.fourStarReviews,
    required this.threeStarReviews,
    required this.twoStarReviews,
    required this.oneStarReviews,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) {
    return Ratings(
      averageRatings: json['averageRatings'] ?? '',
      totalReviews: json['totalReviews'] ?? 0,
      fiveStarReviews: json['fiveStarReviews'] ?? 0,
      fourStarReviews: json['fourStarReviews'] ?? 0,
      threeStarReviews: json['threeStarReviews'] ?? 0,
      twoStarReviews: json['twoStarReviews'] ?? 0,
      oneStarReviews: json['oneStarReviews'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageRatings': averageRatings,
      'totalReviews': totalReviews,
      'fiveStarReviews': fiveStarReviews,
      'fourStarReviews': fourStarReviews,
      'threeStarReviews': threeStarReviews,
      'twoStarReviews': twoStarReviews,
      'oneStarReviews': oneStarReviews,
    };
  }
}

class Review {
  Ratings ratings;
  TopReview topReview;

  Review({
    required this.ratings,
    required this.topReview,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        ratings: Ratings.fromJson(json['ratings'] ?? {}),
        topReview: TopReview.fromJson(json['topReview'] ?? {}));
  }
}
