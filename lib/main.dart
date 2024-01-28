import 'package:flutter/material.dart';
import 'package:tezz_cafe/app.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const App());
}
