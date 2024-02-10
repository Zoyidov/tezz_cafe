import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/product/models/product_model.dart';
import 'package:tezz_cafe/data/product/repositories/product_repository_impl.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = getIt<ProductRepositoryImpl>();

  ProductBloc() : super(const ProductState()) {
    on<GetProductByMenuId>(_onGetProductByMenuId);
    on<ProductIncrement>(_onProductIncrement);
    on<ProductDecrement>(_onProductDecrement);
    on<SetProductCount>(_onSetProductCount);
  }

  void _onSetProductCount(SetProductCount event, Emitter<ProductState> emit) => emit(state.copyWith(count: 1));

  void _onProductIncrement(ProductIncrement event, Emitter<ProductState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  void _onProductDecrement(ProductDecrement event, Emitter<ProductState> emit) {
    if (state.count <= 1) {
      return;
    }
    emit(state.copyWith(count: state.count - 1));
  }

  void _onGetProductByMenuId(GetProductByMenuId event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await productRepository.getProductByMenuId(event.menuId);
    result.fold(
      (l) => emit(state.copyWith(status: FormzSubmissionStatus.failure, error: l.message)),
      (r) => emit(state.copyWith(status: FormzSubmissionStatus.success, products: r)),
    );
  }
}
