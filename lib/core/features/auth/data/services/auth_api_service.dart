import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../config/api_config.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthApiService {
  static const String _login = ApiConfig.loginEndpoint;

  Future<LoginResponse> login(LoginRequest req) async {
    final uri = Uri.parse('$_login').replace(
      queryParameters: {
        'email': req.email,
        'password': req.password,
      },
    );

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      final map = jsonDecode(res.body) as Map<String, dynamic>;
      return LoginResponse.fromJson(map);
    } else {
      // رجّع رسالة السيرفر لو فيه
      final body = res.body.isNotEmpty ? res.body : 'Login failed';
      throw Exception(body);
    }
    }
}