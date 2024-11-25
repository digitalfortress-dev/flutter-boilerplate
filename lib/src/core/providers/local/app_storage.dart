import 'package:hive/hive.dart';

import 'pref/app_pref.dart';
import 'pref/pref_helper.dart';

class AppStorage {
  static const _prefsBox = 'prefs';

  AppStorage._();

  static Future<AppStorage> init() async {
    if (!(Hive.isBoxOpen(_prefsBox))) {
      await Hive.openBox(_prefsBox);
    }
    return AppStorage._();
  }

  static AppStorage use() {
    return AppStorage._();
  }

  PrefHelper get prefHelper => AppPrefs(prefBox: Hive.box(_prefsBox));
}
