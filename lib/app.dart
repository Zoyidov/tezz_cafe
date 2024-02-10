import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tezz_cafe/business_logic/order/order_bloc.dart';
import 'package:tezz_cafe/business_logic/order_item/order_item_bloc.dart';
import 'package:tezz_cafe/business_logic/table/table_bloc.dart';
import 'package:tezz_cafe/business_logic/zone/zone_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:tezz_cafe/feature/auth/presentation/manager/auth_bloc.dart';
import 'package:tezz_cafe/feature/clients/domain/use_cases/get_zones_usecase.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/menu/domain/use_cases/get_menu_items_use_case.dart';
import 'package:tezz_cafe/feature/menu/presentation/manager/menu_bloc.dart';
import 'package:tezz_cafe/feature/navigation/presentation/manager/tab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/feature/navigation/presentation/pages/tab_box.dart';
import 'package:tezz_cafe/feature/orders/data/repositories/oreder_repository.dart';
import 'package:tezz_cafe/feature/product/domain/use_cases/get_product_by_menu_id_usecase.dart';
import 'package:tezz_cafe/feature/product/presentation/manager/product_bloc.dart';
import 'package:tezz_cafe/feature/waitress/domain/use_cases/get_waitress_by_token.dart';
import 'package:tezz_cafe/feature/waitress/presentation/manager/waitress_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabCubit()),
        BlocProvider(create: (context) => ZoneBloc()..add(FetchZoneByCafeIdEvent('1'))),
        BlocProvider(create: (context) => OrderItemBloc()),
        BlocProvider(create: (context) => TableBloc()..add(GetTablesByCafeEvent('1'))),
        BlocProvider(create: (context) => OrderBloc()..add(FetchOrdersByCafeIdEvent('1', '1'))),
        BlocProvider(create: (context) => WaitressBloc(getIt.get<GetWaitressByToken>())),
        BlocProvider(create: (context) => ClientTabBloc()),
        BlocProvider(create: (context) => MenuBloc(getIt.get<GetMenuItemsUseCase>())),
        BlocProvider(create: (context) => AuthBloc(getIt.get<LoginUseCase>())..add(AuthInitial())),
        BlocProvider(create: (context) => ProductBloc(getIt.get<GetProductByMenuIdUseCase>())),
      ],
      child: const MainApp(),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
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
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            filled: true,
            fillColor: AppColors.textFieldColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
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
              minLeadingWidth: 12)),
      home: TabBox(),
      // onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
