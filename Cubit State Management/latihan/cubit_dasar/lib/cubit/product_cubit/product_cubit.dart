import 'package:bloc/bloc.dart';
import 'package:cubit_dasar/cubit/product_cubit/product_state.dart';
import 'package:cubit_dasar/models/detail_product_model/detail_product_model.dart';
import 'package:dio/dio.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());

  Future<void> getProductData() async {
    emit(state.copyWith(isLoading: true));

    var response = await Dio().get('https://fakestoreapi.com/products/1');

    if (response.statusCode == 200) {
      var data = DetailProductModel.fromMap(response.data);
      emit(state.copyWith(detailProduct: data));
    } else {
      emit(state.copyWith(error: 'Gagal menampilkan product data'));
    }
    emit(state.copyWith(isLoading: false));
  }
}
