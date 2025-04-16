import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'article.dart';

class NewsModel extends Equatable {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromMap(Map<String, dynamic> data) => NewsModel(
    status: data['status'] as String?,
    totalResults: data['totalResults'] as int?,
    articles:
        (data['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromMap(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toMap() => {
    'status': status,
    'totalResults': totalResults,
    'articles': articles?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NewsModel].
  factory NewsModel.fromJson(String data) {
    return NewsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NewsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  NewsModel copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return NewsModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, totalResults, articles];
}
