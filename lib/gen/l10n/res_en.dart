import 'res.dart';

/// The translations for English (`en`).
class ResourceEn extends Resource {
  ResourceEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get appName => 'Codebase Clean Architecture';

  @override
  String get setting => 'Settings';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get errorInternetConnection => 'Please check the internet connection';

  @override
  String get retry => 'Retry';
}
