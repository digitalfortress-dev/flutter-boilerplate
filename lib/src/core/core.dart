import 'config/environment.dart';
import 'di/locator.dart';

class Core {
  static void init(Environment environment) {
    setupLocator(environment);
  }
}
