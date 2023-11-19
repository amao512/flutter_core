import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static SharedPrefManager? _instance;
  SharedPreferences? _sharedPreferences;

  factory SharedPrefManager() {
    _instance ??= SharedPrefManager._();
    return _instance!;
  }

  SharedPrefManager._();

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? get sharedPreferences => _sharedPreferences;
}