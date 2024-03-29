
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/app.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/waitress/data/models/waitress_model.dart';
import 'package:tezz_cafe/feature/waitress/domain/use_cases/get_waitress_by_token.dart';
import 'package:toastification/toastification.dart';

part 'waitress_event.dart';

part 'waitress_state.dart';

class WaitressBloc extends Bloc<WaitressEvent, WaitressState> {
  final GetWaitressByToken getWaitressByToken;

  WaitressBloc(this.getWaitressByToken) : super(const WaitressState()) {
    on<WaitressInitial>(_onWaitressInitial);
    on<GetWaitressEvent>(_onGetWaitress);
  }

  void _onWaitressInitial(WaitressInitial event, Emitter<WaitressState> emit) {

  }
  void _onGetWaitress(GetWaitressEvent event, Emitter<WaitressState> emit) async {

    final result = await getWaitressByToken.execute(event.token);

    result.fold(
      (l) async{
          print(l);
          print('xato');
        // toastification.show(context: navigatorKey.currentContext!,type: ToastificationType.error,style: ToastificationStyle.fillColored,title: const Text('Xatolik'),autoCloseDuration: const Duration(seconds: 5),alignment: Alignment.bottomCenter,description: Text(l.message));
        // Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
        emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: l));
          await StorageRepository.putBool(StorageKeys.isAuth,false);

        // Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
        return;
        emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: l));
      },
      (r) async {
        print(r);


        navigatorKey.currentContext!.read<ClientTabBloc>().add(GetZones(r.cafe.toString()));
        navigatorKey.currentContext!.read<ClientTabBloc>().add(GetTablesByCafe(r.cafe.toString()));
        emit(state.copyWith(status: FormzSubmissionStatus.success, waitress: r));
        await StorageRepository.putString(StorageKeys.waiterId, r.id.toString());
        await StorageRepository.putString(StorageKeys.cafeId, r.cafe.toString());
        print("${StorageRepository.getString(StorageKeys.cafeId)}0000000000000000000000000");
      },
    );
  }
}
