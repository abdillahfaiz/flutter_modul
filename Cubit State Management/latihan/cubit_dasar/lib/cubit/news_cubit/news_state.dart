// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cubit_dasar/models/news_model/news_model.dart';
import 'package:cubit_dasar/models/product_model/product_model.dart';

class NewsState extends Equatable {
  const NewsState({
    this.newsData = const NewsModel(),
    this.error = '',
    this.isLoading = false,
  });

  final NewsModel newsData;
  final String error;
  final bool isLoading;

  @override
  List<Object> get props => [newsData, error, false];

  NewsState copyWith({NewsModel? newsData, String? error, bool? isLoading}) {
    return NewsState(
      newsData: newsData ?? this.newsData,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
