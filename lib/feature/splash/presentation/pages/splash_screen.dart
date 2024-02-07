import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/waitress/presentation/manager/waitress_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeIn(
          onFinish: (direction) {
            final bool isAuth = StorageRepository.getBool(StorageKeys.isAuth);
            // if (context.read<WaitressBloc>().state.waitress == null) {
            //   Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
            //   context.read<ClientTabBloc>().add(GetZones(StorageRepository.getString(StorageKeys.cafeId)));
            //   context.read<ClientTabBloc>().add(GetTablesByCafe(StorageRepository.getString(StorageKeys.cafeId)));
            //   return;
            // }
            // print(isAuth && context.read<WaitressBloc>().state.waitress != null);
            // print(context.read<WaitressBloc>().state.waitress?.ofisiant.username);
            // if (isAuth) {
            if (isAuth) {
              context.read<WaitressBloc>().add(GetWaitressEvent(StorageRepository.getString(StorageKeys.token)));
              context.read<ClientTabBloc>().add(GetZones(StorageRepository.getString(StorageKeys.cafeId)));
              context.read<ClientTabBloc>().add(GetTablesByCafe(StorageRepository.getString(StorageKeys.cafeId)));
              Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.home, (route) => false);
              return;
            }
            Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
          },
          duration: const Duration(seconds: 2),
          child: Image.asset(
            AppImages.appIcon,
            width: context.width * 0.5,
          ),
        ),
      ),
    );
  }
}
