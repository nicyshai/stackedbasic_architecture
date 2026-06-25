import 'dart:convert';
RespProducts respProductsFromJson(String str) => RespProducts.fromJson(json.decode(str));
String respProductsToJson(RespProducts data) => json.encode(data.toJson());
class RespProducts {
  RespProducts({
      this.msg, 
      this.data,});

  RespProducts.fromJson(dynamic json) {
    msg = json['Msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Products.fromJson(v));
      });
    }
  }
  String? msg;
  List<Products>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
//..................................................


Products dataFromJson(String str) => Products.fromJson(json.decode(str));
String dataToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.stock, 
      this.category, 
      this.imageUrl,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    category = json['category'];
    imageUrl = json['image_url'];
  }
  num? id;
  String? name;
  String? description;
  String? price;
  num? stock;
  String? category;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['stock'] = stock;
    map['category'] = category;
    map['image_url'] = imageUrl;
    return map;
  }

}