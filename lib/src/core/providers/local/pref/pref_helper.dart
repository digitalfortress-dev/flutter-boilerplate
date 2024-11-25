abstract class PrefHelper {
  Future<bool> firstRun();

  Future<void> setFirstRun(bool isFirstRun);

  Future<String?> getToken();

  Future setToken(String token);

  Future setLanguageCode(String languageCode);

  String getLanguageCode();

  // Future saveUser(UserDataModel user);

  // Future<UserDataModel?> getUserSaved();
}
