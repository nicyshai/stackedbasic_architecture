import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/User.dart';

class UserService {
  static const String _userKey = 'user_session';

  /// Saves the user session to SharedPreferences
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  /// Retrieves the saved user session
  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      try {
        return User.fromJson(jsonDecode(userJson));
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets the access key from the stored user session
  Future<String?> getAccessKey() async {
    final user = await getUser();
    return user?.access;
  }

  /// Clears the user session (Logout)
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
