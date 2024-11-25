import 'package:get_it/get_it.dart';

import '../config/app_config.dart';
import '../config/environment.dart';

final locator = GetIt.instance;

void setupLocator(Environment environment) {
  locator.registerSingleton(AppConfig(environment));
}
