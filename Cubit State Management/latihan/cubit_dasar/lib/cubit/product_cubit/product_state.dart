// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cubit_dasar/models/detail_product_model/detail_product_model.dart';

class ProductState extends Equatable {
  const ProductState({
    this.detailProduct = const DetailProductModel(),
    this.isLoading = false,
    this.error = ''
  });

  final DetailProductModel detailProduct;
  final bool isLoading;
  final String error;

  @override
  List<Object> get props => [detailProduct, isLoading, error];

  ProductState copyWith({
    DetailProductModel? detailProduct,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      detailProduct: detailProduct ?? this.detailProduct,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
