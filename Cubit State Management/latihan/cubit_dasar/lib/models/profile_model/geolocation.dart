import 'dart:convert';

import 'package:equatable/equatable.dart';

class Geolocation extends Equatable {
  final String? lat;
  final String? long;

  const Geolocation({this.lat, this.long});

  factory Geolocation.fromMap(Map<String, dynamic> data) =>
      Geolocation(lat: data['lat'] as String?, long: data['long'] as String?);

  Map<String, dynamic> toMap() => {'lat': lat, 'long': long};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Geolocation].
  factory Geolocation.fromJson(String data) {
    return Geolocation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Geolocation] to a JSON string.
  String toJson() => json.encode(toMap());

  Geolocation copyWith({String? lat, String? long}) {
    return Geolocation(lat: lat ?? this.lat, long: long ?? this.long);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [lat, long];
}
