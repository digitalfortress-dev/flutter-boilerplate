import 'src/core/config/environment.dart';
import 'src/core/core.dart';
import 'src/main.dart';

void main() {
  Core.init(Environment.dev);
  mainDelegate();
}
