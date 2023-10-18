import 'package:shared_preferences/shared_preferences.dart';

class StoredatalocalService {
  static late SharedPreferences _preferences;

  final _keyToken = 'token';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

//Speicherung-Token
  Future setToken(String token) async =>
      await _preferences.setString(_keyToken, token);

  String? getAccessToken() => _preferences.getString(_keyToken);

  Future<bool> deletAccessToken() => _preferences.remove(_keyToken);
}
