import 'dart:convert';

import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final double? rate;
  final int? count;

  const Rating({this.rate, this.count});

  factory Rating.fromMap(Map<String, dynamic> data) => Rating(
    rate: (data['rate'] as num?)?.toDouble(),
    count: data['count'] as int?,
  );

  Map<String, dynamic> toMap() => {'rate': rate, 'count': count};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Rating].
  factory Rating.fromJson(String data) {
    return Rating.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Rating] to a JSON string.
  String toJson() => json.encode(toMap());

  Rating copyWith({double? rate, int? count}) {
    return Rating(rate: rate ?? this.rate, count: count ?? this.count);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [rate, count];
}
