import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cubit_dasar/models/news_model/news_model.dart';
import 'package:dio/dio.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsState());

  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<void> getNewsData() async {
    emit(state.copyWith(isLoading: true)); // -> Loading
    try {
      // Mengambil data menggunakan method GET
      var response = await dio.get(
        'https://newsapi.org/v2/everything?q=tesla&from=2025-03-16&sortBy=publishedAt&apiKey=4e7a1fbfe2ad45b393e5c535e458def5',
      );
      //Pengecekan, jika berhasil mengambil data atau status code 200
      if (response.statusCode == 200) {
        var data = NewsModel.fromMap(
          response.data,
        ); // -> convert response.data (yang bentuk nya JSONstring) menjadi map
        // menyimpan data di dalam state newsData dan erubah loading menjadi false
        emit(state.copyWith(newsData: data, isLoading: false));
      } else {
        // jika gagal ambil data maka menyimpan error message di dalam state error dan merubah loading menjadi false
        emit(state.copyWith(error: response.data['message'], isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(error: 'ini error : $e', isLoading: false));
    }
  }
}
