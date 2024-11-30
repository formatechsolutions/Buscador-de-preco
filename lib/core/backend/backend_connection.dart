import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendConnection {
  final String backendUrl = 'https://8c62-179-49-254-150.ngrok-free.app/api';
  final String backendUrlRender = 'https://buscapreco-backend.onrender.com/api';

  Future<http.Response?> _tryRequest(
      Future<http.Response> Function(String url) request, String url) async {
    try {
      return await request(backendUrl + url);
    } catch (e) {
      try {
        return await request(backendUrlRender + url);
      } catch (e) {
        return null;
      }
    }
  }

  Future<http.Response?> get(String url, Map<String, String> queryParams) {
    final uri =
        Uri.parse(backendUrl + url).replace(queryParameters: queryParams);
    return _tryRequest((baseUrl) async {
      return http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
    }, url);
  }

  Future<http.Response?> post(String url, Map<String, dynamic> body) {
    return _tryRequest((baseUrl) async {
      return http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
    }, url);
  }

  Future<String?> createUser(String email, String password) async {
    final response =
        await post('/users', {'email': email, 'password': password});
    if (response != null && response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    final response =
        await post('/login', {'email': email, 'password': password});
    if (response != null && response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<void> sendEmailResetPassword(String email, String token) async {
    final response =
        await post('/send-email', {'email': email, 'token': token});

    if (response != null && response.statusCode == 200) {
      return;
    }
  }

  Future<bool> checkTokenExists(String token) async {
    final response = await get('/checktoken-resetpass', {'token': token});
    return response != null && response.statusCode == 200;
  }
}
