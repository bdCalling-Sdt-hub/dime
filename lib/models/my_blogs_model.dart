class MyBlogsModel {
  final String status;
  final String statusCode;
  final String message;
  final BlogData data;

  MyBlogsModel({
    this.status = "OK",
    this.statusCode = '200',
    this.message = "blog-list",
    required this.data,
  });

  factory MyBlogsModel.fromJson(Map<String, dynamic> json) {
    return MyBlogsModel(
      status: json['status'] ?? "OK",
      statusCode: json['statusCode'] ?? '200',
      message: json['message'] ?? "blog-list",
      data: BlogData.fromJson(json['data'] ?? {}),
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

class BlogData {
  final String type;
  final BlogAttributes attributes;

  BlogData({
    this.type = "blog",
    required this.attributes,
  });

  factory BlogData.fromJson(Map<String, dynamic> json) {
    return BlogData(
      type: json['type'] ?? "blog",
      attributes: BlogAttributes.fromJson(json['attributes'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes.toJson(),
    };
  }
}

class BlogAttributes {
  final List<Blog> blogsList;
  final Pagination pagination;

  BlogAttributes({
    this.blogsList = const [],
    required this.pagination,
  });

  factory BlogAttributes.fromJson(Map<String, dynamic> json) {
    var list = json['blogsList'] as List? ?? [];
    List<Blog> blogs = list.map((i) => Blog.fromJson(i)).toList();

    return BlogAttributes(
      blogsList: blogs,
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blogsList': blogsList.map((blog) => blog.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}

class Blog {
  final String id;
  final String image;
  final String title;
  final String category;
  final int price;
  final String details;
  final User user;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Blog({
    this.id = "",
    this.image = "",
    this.title = "",
    this.category = "",
    this.price = 0,
    this.details = "",
    required this.user,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['_id'] ?? "",
      image: json['image'] ?? "",
      title: json['title'] ?? "",
      category: json['category'] ?? "",
      price: json['price'] ?? 0,
      details: json['details'] ?? "",
      user: User.fromJson(json['user']),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'title': title,
      'category': category,
      'price': price,
      'details': details,
      'user': user.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class User {
  final String id;
  final String fullName;
  final String image;

  User({
    this.id = "",
    this.fullName = "",
    this.image = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? "",
      fullName: json['fullName'] ?? "",
      image: json['image'] ?? "",
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

class Pagination {
  final int totalResults;
  final int totalPages;
  final int currentPage;
  final int limit;

  Pagination({
    this.totalResults = 0,
    this.totalPages = 0,
    this.currentPage = 1,
    this.limit = 10,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      totalResults: json['totalResults'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['currentPage'] ?? 1,
      limit: json['limit'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalResults': totalResults,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'limit': limit,
    };
  }
}
