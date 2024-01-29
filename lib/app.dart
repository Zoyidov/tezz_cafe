import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/menu/presentation/manager/menu_bloc.dart';
import 'package:tezz_cafe/feature/navigation/presentation/manager/tab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabCubit>(create: (context) => TabCubit()),
        BlocProvider<ClientTabBloc>(create: (context) => ClientTabBloc()),
        BlocProvider<MenuBloc>(create: (context) => MenuBloc()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              surfaceTintColor: Colors.white,
              iconTheme: IconThemeData(color: AppColors.black300),
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: AppColors.black,
              )),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              shape: const CircleBorder(), backgroundColor: AppColors.primaryColor, foregroundColor: Colors.white),
          toggleButtonsTheme: ToggleButtonsThemeData(
            selectedColor: AppColors.toggleSelectedColor,
            borderRadius: BorderRadius.circular(8),
            color: AppColors.toggleUnSelectedColor,
            fillColor: AppColors.toggleUnSelectedColor,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2),
          ),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
            textStyle: context.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            minimumSize: const Size.fromHeight(44),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: AppColors.primaryColor,
          )),
      listTileTheme: ListTileThemeData(
        titleTextStyle: context.bodyLarge?.copyWith(color: AppColors.grey500),
        leadingAndTrailingTextStyle: context.bodyLarge?.copyWith(color: AppColors.grey500),
        minLeadingWidth: 12
      )),

      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
