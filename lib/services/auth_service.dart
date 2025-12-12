import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
  
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  Future<User?> login(String username, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
        'expiresInMins': 30, // optional, defaults to 60
      });

      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        await _saveUser(user);
        return user;
      }
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
    return null;
  }

  Future<User?> refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? rToken = prefs.getString('refreshToken');
      
      if (rToken == null) return null;

      final response = await _dio.post('/auth/refresh', data: {
        'refreshToken': rToken,
        'expiresInMins': 30,
      });

      if (response.statusCode == 200) {
        // The refresh endpoint returns a new access token and refresh token
        // But it creates a new "session" or user object structure?
        // DummyJSON refresh response: { "token": "...", "refreshToken": "...", ...user data... }
        
        final user = User.fromJson(response.data);
        await _saveUser(user);
        return user;
      }
    } catch (e) {
      print('Refresh token error: $e');
      // If refresh fails, maybe clear data?
      // await logout(); 
    }
    return null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user_data')) {
      final jsonStr = prefs.getString('user_data');
      if (jsonStr != null) {
        return User.fromJson(jsonDecode(jsonStr));
      }
    }
    return null;
  }

  Future<void> _saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', jsonEncode(user.toJson()));
    await prefs.setString('token', user.token);
    await prefs.setString('refreshToken', user.refreshToken);
  }
}
