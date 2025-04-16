import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'category.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? title;
  final String? slug;
  final int? price;
  final String? description;
  final Category? category;
  final List<String>? images;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  const ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) => ProductModel(
    id: data['id'] as int?,
    title: data['title'] as String?,
    slug: data['slug'] as String?,
    price: data['price'] as int?,
    description: data['description'] as String?,
    category:
        data['category'] == null
            ? null
            : Category.fromMap(data['category'] as Map<String, dynamic>),
    images: data['images'] as List<String>?,
    creationAt:
        data['creationAt'] == null
            ? null
            : DateTime.parse(data['creationAt'] as String),
    updatedAt:
        data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'slug': slug,
    'price': price,
    'description': description,
    'category': category?.toMap(),
    'images': images,
    'creationAt': creationAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductModel].
  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ProductModel copyWith({
    int? id,
    String? title,
    String? slug,
    int? price,
    String? description,
    Category? category,
    List<String>? images,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      images: images ?? this.images,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      slug,
      price,
      description,
      category,
      images,
      creationAt,
      updatedAt,
    ];
  }
}
