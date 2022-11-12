// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse(
    products: (json['products'] as List<dynamic>)
        .map((e) => ProductResult.fromJson(e as Map<String, dynamic>))
        .toList(),
    total: json['total'] as int,
    skip: json['skip'] as int,
    limit: json['limit'] as int,
  );
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

ProductResult _$ProductResultFromJson(Map<String, dynamic> json) {
  return ProductResult(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    price: json['price'] as int,
    discountPercentage: (json['discountPercentage'] as num).toDouble(),
    rating: (json['rating'] as num).toDouble(),
    stock: json['stock'] as int,
    brand: json['brand'] as String,
    category: json['category'] as String,
    thumbnail: json['thumbnail'] as String,
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ProductResultToJson(ProductResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'brand': instance.brand,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
    };
