import 'dart:developer';

import 'package:cubit_dasar/models/create_product_model.dart';
import 'package:cubit_dasar/models/detail_product_model/detail_product_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class ProductService {
  final dio = Dio();

  Future<Either<String, DetailProductModel>> fetchProductDetail() async {
    try {
      var response = await dio.get('https://fakestoreapi.com/products/1');

      if (response.statusCode == 200) {
        var data = DetailProductModel.fromMap(response.data);
        // emit(state.copyWith(detailProduct: data));
        return Right(data);
      } else {
        // emit(state.copyWith(error: 'Gagal menampilkan product data'));
        return Left('Gagal menampilkan product data');
      }
    } on DioException catch (e) {
      log(e.message.toString());
      return Left('Error : ${e.message}');
    }
  }

  Future<Either<String, CreateProductModel>> createProduct({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
  }) async {
    try {
      var response = await dio.post(
        'https://fakestoreapi.com/products',
        data: {
          "id": id,
          "title": title,
          "price": price,
          "description": description,
          "category": category,
          "image": image,
        },
      );

      if (response.statusCode == 200) {
        var data = CreateProductModel.fromMap(response.data);
        // emit(state.copyWith(detailProduct: data));
        return Right(data);
      } else {
        // emit(state.copyWith(error: 'Gagal menampilkan product data'));
        return Left('Gagal menambahkan product');
      }
    } on DioException catch (e) {
      return Left('Error : ${e.message}');
    }
  }
}
