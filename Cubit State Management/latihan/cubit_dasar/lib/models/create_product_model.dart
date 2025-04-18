import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateProductModel extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? image;
  final String? category;

  const CreateProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
    this.category,
  });

  factory CreateProductModel.fromMap(Map<String, dynamic> data) {
    return CreateProductModel(
      id: data['id'] as int?,
      title: data['title'] as String?,
      price: (data['price'] as num?)?.toDouble(),
      description: data['description'] as String?,
      image: data['image'] as String?,
      category: data['category'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'image': image,
    'category': category,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateProductModel].
  factory CreateProductModel.fromJson(String data) {
    return CreateProductModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [CreateProductModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CreateProductModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? image,
    String? category,
  }) {
    return CreateProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, title, price, description, image, category];
  }
}
