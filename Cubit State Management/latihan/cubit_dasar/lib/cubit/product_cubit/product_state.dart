// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cubit_dasar/models/create_product_model.dart';
import 'package:cubit_dasar/models/detail_product_model/detail_product_model.dart';

class ProductState extends Equatable {
  const ProductState({
    this.detailProduct = const DetailProductModel(),
    this.createProductModel = const CreateProductModel(),
    this.isLoading = false,
    this.error = '',
  });

  final DetailProductModel detailProduct;
  final CreateProductModel createProductModel;
  final bool isLoading;
  final String error;

  @override
  List<Object> get props => [detailProduct, isLoading, error, createProductModel];

  ProductState copyWith({
    DetailProductModel? detailProduct,
    CreateProductModel? createProductModel,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      detailProduct: detailProduct ?? this.detailProduct,
      createProductModel: createProductModel ?? this.createProductModel,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
