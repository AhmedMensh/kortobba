import 'product_model.dart';

class ProductsResponse {
  ProductsResponse({
      this.count, 
      this.next, 
      this.previous, 
      this.products,});

  ProductsResponse.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      products = [];
      json['results'].forEach((v) {
        products?.add(ProductModel.fromJson(v));
      });
    }
  }
  int? count;
  dynamic next;
  dynamic previous;
  List<ProductModel>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (products != null) {
      map['results'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}