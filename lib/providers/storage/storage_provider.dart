export 'package:arties_flutter_prototype/providers/storage/storage_variables.dart';
import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider {
  SharedPreferences _prefs = locator<SharedPreferences>();

  Future<String> getString(String key) async => _prefs.getString(key);
  Future<bool> getBool(String key) async => _prefs.getBool(key);

  Future<bool> setString(String key, String value) async => _prefs.setString(key, value);
  Future<bool> setBool(String key, bool value) async => _prefs.setBool(key, value);
  
}