import 'package:shared_preferences/shared_preferences.dart';

const String tokenKey = "userToken";
const String prefsKeyOnboardingScreenViewed =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";

class AppPrefs{
  final SharedPreferences _sharedPreferences;
  AppPrefs(this._sharedPreferences);

  Future<void>setOnboardingScreenViewed()async{
    await _sharedPreferences.setBool(prefsKeyOnboardingScreenViewed, true);
  }

  Future<bool>isOnboardingScreenViewed()async{
    return  _sharedPreferences.getBool(prefsKeyOnboardingScreenViewed)?? false;
  }

  Future<void>removeSharedPrefs()async{
    await _sharedPreferences.remove(prefsKeyOnboardingScreenViewed);
  }

  Future<void>setToken(String token)async{
    await _sharedPreferences.setString(tokenKey, token);
  }

  String? getToken() {
    return _sharedPreferences.getString(tokenKey);
  }

  Future<void>removeToken()async{
    await _sharedPreferences.remove(tokenKey);
  }
}