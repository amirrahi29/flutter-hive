import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel{

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;

  ProductModel({this.id,this.title});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'title': title,
    };
  }

  String toString(){
    return 'id: $id, title: $title';
  }

}