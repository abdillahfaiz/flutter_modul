import 'dart:convert';

import 'package:equatable/equatable.dart';

class Name extends Equatable {
  final String? firstname;
  final String? lastname;

  const Name({this.firstname, this.lastname});

  factory Name.fromMap(Map<String, dynamic> data) => Name(
    firstname: data['firstname'] as String?,
    lastname: data['lastname'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'firstname': firstname,
    'lastname': lastname,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Name].
  factory Name.fromJson(String data) {
    return Name.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Name] to a JSON string.
  String toJson() => json.encode(toMap());

  Name copyWith({String? firstname, String? lastname}) {
    return Name(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [firstname, lastname];
}
