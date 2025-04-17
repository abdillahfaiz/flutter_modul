import 'package:cubit_dasar/models/detail_product_model/detail_product_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class ProductService {
  Future<Either<String, DetailProductModel>> fetchProductDetail() async {
    try {
      var response = await Dio().get('https://fakestoreapi.com/products/1');

      if (response.statusCode == 200) {
        var data = DetailProductModel.fromMap(response.data);
        // emit(state.copyWith(detailProduct: data));
        return Right(data);
      } else {
        // emit(state.copyWith(error: 'Gagal menampilkan product data'));
        return Left('Gagal menampilkan product data');
      }
    } on DioException catch (e) {
      return Left('Error : ${e.message}');
    }
  }
}
