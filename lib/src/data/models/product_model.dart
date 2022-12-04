import 'package:kortoba_flutter_task/src/domain/entities/product.dart';

import 'category_model.dart';

class ProductModel extends Product {
  ProductModel({
    this.id,
    this.name,
    this.imageLink,
    this.price,
    this.description,
    this.rate,
    this.category,
  }) : super(
            id: id,
            description: description,
            imageLink: imageLink,
            name: name,
            price: price,
            rate: rate);

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  CategoryModel? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image_link'] = imageLink;
    map['price'] = price;
    map['description'] = description;
    map['rate'] = rate;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }
}
