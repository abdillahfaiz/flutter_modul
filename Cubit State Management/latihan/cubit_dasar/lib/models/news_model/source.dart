import 'dart:convert';

import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? id;
  final String? name;

  const Source({this.id, this.name});

  factory Source.fromMap(Map<String, dynamic> data) =>
      Source(id: data['id'] as String?, name: data['name'] as String?);

  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Source].
  factory Source.fromJson(String data) {
    return Source.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Source] to a JSON string.
  String toJson() => json.encode(toMap());

  Source copyWith({String? id, String? name}) {
    return Source(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
