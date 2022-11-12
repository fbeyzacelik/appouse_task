import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductResponse {
  ProductResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  List<ProductResult> products;
  int total;
  int skip;
  int limit;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductResult {
  ProductResult({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  factory ProductResult.fromJson(Map<String, dynamic> json) =>
      _$ProductResultFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResultToJson(this);
}
