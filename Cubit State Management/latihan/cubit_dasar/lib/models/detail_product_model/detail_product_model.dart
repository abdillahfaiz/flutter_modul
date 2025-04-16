import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'rating.dart';

class DetailProductModel extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  const DetailProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory DetailProductModel.fromMap(Map<String, dynamic> data) {
    return DetailProductModel(
      id: data['id'] as int?,
      title: data['title'] as String?,
      price: (data['price'] as num?)?.toDouble(),
      description: data['description'] as String?,
      category: data['category'] as String?,
      image: data['image'] as String?,
      rating:
          data['rating'] == null
              ? null
              : Rating.fromMap(data['rating'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DetailProductModel].
  factory DetailProductModel.fromJson(String data) {
    return DetailProductModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [DetailProductModel] to a JSON string.
  String toJson() => json.encode(toMap());

  DetailProductModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return DetailProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, title, price, description, category, image, rating];
  }
}
