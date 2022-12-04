class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.imageLink,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
  }

  int? id;
  String? name;
  String? imageLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image_link'] = imageLink;
    return map;
  }
}
