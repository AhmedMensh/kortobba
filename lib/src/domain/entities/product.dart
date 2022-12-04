
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  Product({
    this.id,
    this.name,
    this.imageLink,
    this.price,
    this.description,
    this.rate,
    });

  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;


  @override
  List<Object?> get props => [id,name,imageLink,price,description,rate];

}