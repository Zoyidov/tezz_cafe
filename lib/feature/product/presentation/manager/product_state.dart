part of 'product_bloc.dart';

class ProductState {
  final bool isVisible;
  final FormzSubmissionStatus status;
  final List<ProductModel> products;
  final String error;
  final int count;

  const ProductState({
    this.isVisible = true,
    this.status = FormzSubmissionStatus.initial,
    this.products = const [],
    this.error = '',
    this.count = 1,
  });

  ProductState copyWith({
    bool? isVisible,
    FormzSubmissionStatus? status,
    List<ProductModel>? products,
    String? error,
    int? count,
  }) {
    return ProductState(
      isVisible: isVisible ?? this.isVisible,
      status: status ?? this.status,
      products: products ?? this.products,
      error: error ?? this.error,
      count: count ?? this.count,
    );
  }
}
