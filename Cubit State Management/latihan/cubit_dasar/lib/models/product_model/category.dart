import 'dart:convert';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  const Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromMap(Map<String, dynamic> data) => Category(
    id: data['id'] as int?,
    name: data['name'] as String?,
    slug: data['slug'] as String?,
    image: data['image'] as String?,
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
    'name': name,
    'slug': slug,
    'image': image,
    'creationAt': creationAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Category].
  factory Category.fromJson(String data) {
    return Category.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Category] to a JSON string.
  String toJson() => json.encode(toMap());

  Category copyWith({
    int? id,
    String? name,
    String? slug,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      image: image ?? this.image,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, name, slug, image, creationAt, updatedAt];
  }
}
