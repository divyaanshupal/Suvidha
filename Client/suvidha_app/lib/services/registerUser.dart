import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthResponse {
  final bool success;
  final String? token;
  final Map<String, dynamic>? user;
  final String? message;

  AuthResponse({
    required this.success,
    this.token,
    this.user,
    this.message,
  });
}

class AuthService {
  // Base URL - update this with your server URL
  static const String baseUrl = 'https://suvidha-5w0x.onrender.com/api/auth';
  
  // For Android emulator, use: 'http://10.0.2.2:5000/api/auth'
  // For iOS simulator, use: 'http://localhost:5000/api/auth'
  // For physical device, use your computer's IP: 'http://192.168.x.x:5000/api/auth'

  /// Register a new user with email and password
  /// Note: Server also requires 'name', so it's included as a generated value
  /// You can modify this to accept name as a parameter if needed
  static Future<AuthResponse> registerUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': email.split('@')[0], // Generate name from email prefix
          // Or use: 'name': 'User', if you prefer a default name
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return AuthResponse(
          success: true,
          token: data['token'],
          user: data['user'],
        );
      } else {
        final data = jsonDecode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Registration failed',
        );
      }
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }

  /// Login user with email and password
  static Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AuthResponse(
          success: true,
          token: data['token'],
          user: data['user'],
        );
      } else {
        final data = jsonDecode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Login failed',
        );
      }
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }
}
