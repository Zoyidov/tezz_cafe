import 'package:flutter/material.dart';
import 'package:tezz_cafe/business_logic/cubit/tab_cubit.dart';
import 'package:tezz_cafe/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabCubit>(
          create: (context) => TabCubit(),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: TAppTheme.lightTheme,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        home: LoginScreen()
        // onGenerateRoute: AppRoutes.generateRoute,
        );
  }
}
