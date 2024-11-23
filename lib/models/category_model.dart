class CategoryModel {
  String id;
  String name;
  String key;
  String image;
  int v;

  CategoryModel({
    required this.id,
    required this.name,
    required this.key,
    required this.image,
    required this.v,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
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
