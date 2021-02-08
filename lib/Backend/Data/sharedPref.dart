import 'package:shared_preferences/shared_preferences.dart';

class OnboardingData {
  //true will not show
  //false will show
  static const OnboardingDataKey = "OnboardingDataKey";

  static setOnbData(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(OnboardingDataKey, value);
  }

  static Future<bool> getOnbData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(OnboardingDataKey) ?? false;
  }
}
