import 'package:bloc/bloc.dart';
import 'package:cubit_dasar/cubit/product_cubit/product_state.dart';
import 'package:cubit_dasar/datasource/product_service.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());

  Future<void> getProductData() async {
    emit(state.copyWith(isLoading: true));

    var data = await ProductService().fetchProductDetail();

    data.fold(
      (left) => emit(state.copyWith(error: left)),
      (right) => emit(state.copyWith(detailProduct: right)),
    );

    emit(state.copyWith(isLoading: false));
  }

  Future<void> createProduct({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
  }) async {
    emit(state.copyWith(isLoading: true));

    var data = await ProductService().createProduct(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
    );

    data.fold(
      (left) => emit(state.copyWith(error: left)),
      (right) => emit(state.copyWith(createProductModel: right)),
    );

    emit(state.copyWith(isLoading: false));
  }
}
