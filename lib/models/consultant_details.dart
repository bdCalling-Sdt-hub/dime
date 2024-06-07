class ConsultantDetailsModel {
  Consultant consultant;
  Review review;

  ConsultantDetailsModel({
    Consultant? consultant,
    Review? review,
  })  : consultant = consultant ?? Consultant.fromJson({}),
        review = review ?? Review.fromJson({});

  factory ConsultantDetailsModel.fromJson(Map<String, dynamic> json) {
    return ConsultantDetailsModel(
      consultant: Consultant.fromJson(json['consultant'] ?? {}),
      review: Review.fromJson(json['review'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'consultant': consultant.toJson(),
      'review': review.toJson(),
    };
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
  String fullName;
  String email;
  String phoneNumber;
  String countryCode;
  String image;
  String password;
  String role;
  int consultationCompleted;
  int ratings;
  int averageResponseTime;
  String createdAt;
  String updatedAt;
  int v;
  String aboutMe;
  Availability availability;
  List<Category> category;
  String gender;
  String title;
  int videoConferenceFee;
  int videoReplyFee;

  Consultant({
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

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return Consultant(
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
      averageRatings: (json['averageRatings'] ?? ''),
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
      topReview: TopReview.fromJson(json['topReview'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ratings': ratings.toJson(),
      'topReview': topReview.toJson(),
    };
  }
}
