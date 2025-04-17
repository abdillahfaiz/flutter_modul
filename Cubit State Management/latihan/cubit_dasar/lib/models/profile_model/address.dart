import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'geolocation.dart';

class Address extends Equatable {
  final Geolocation? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  const Address({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  factory Address.fromMap(Map<String, dynamic> data) => Address(
    geolocation:
        data['geolocation'] == null
            ? null
            : Geolocation.fromMap(data['geolocation'] as Map<String, dynamic>),
    city: data['city'] as String?,
    street: data['street'] as String?,
    number: data['number'] as int?,
    zipcode: data['zipcode'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'geolocation': geolocation?.toMap(),
    'city': city,
    'street': street,
    'number': number,
    'zipcode': zipcode,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());

  Address copyWith({
    Geolocation? geolocation,
    String? city,
    String? street,
    int? number,
    String? zipcode,
  }) {
    return Address(
      geolocation: geolocation ?? this.geolocation,
      city: city ?? this.city,
      street: street ?? this.street,
      number: number ?? this.number,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [geolocation, city, street, number, zipcode];
}
