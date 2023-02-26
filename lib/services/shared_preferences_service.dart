import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class SharedPreferencesService {
  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("hasUser") == null) {
      await prefs.setBool("hasUser", false);
      await prefs.setString("userPin", "");
    }
  }
}
