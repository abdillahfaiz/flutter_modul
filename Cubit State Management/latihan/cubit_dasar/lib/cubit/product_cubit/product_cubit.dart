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
}
