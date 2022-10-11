import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/src/modules/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/providers/local/app_storage.dart';
import 'core/utils/bloc_observer.dart';

void mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Config status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent));

  /// Set orientation for app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Hive.initFlutter();
  await AppStorage.init();

  await configureInjection();

  Bloc.observer = AppBlocObserver();

  return runZonedGuarded(() async {
    runApp(const App());
  }, (error, stack) {
    if (kDebugMode) {
      print(stack);
      print(error);
    }
  });
}
