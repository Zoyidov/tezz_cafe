import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/feature/product/data/models/product_model.dart';
import 'package:tezz_cafe/feature/product/domain/use_cases/get_product_by_menu_id_usecase.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductByMenuIdUseCase getProductByMenuIdUseCase;

  ProductBloc(this.getProductByMenuIdUseCase) : super(const ProductState()) {
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
    final result = await getProductByMenuIdUseCase.execute(event.menuId);
    result.fold(
      (l) => emit(state.copyWith(status: FormzSubmissionStatus.failure, error: l.message)),
      (r) => emit(state.copyWith(status: FormzSubmissionStatus.success, products: r)),
    );
  }
}
