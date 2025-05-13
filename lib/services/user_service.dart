import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/user_session.dart';
import '../network/endpoints.dart';

class UserService {
  static Future<bool> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String license,
    DateTime? birthDate,
  }) async {
    final token = await UserSession.getToken();

    final body = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'driver_license': license,
      if (birthDate != null) 'birth_date': birthDate.toIso8601String(),
    };

    print('🔼 Enviando dados para /user/update:');
    print('Token: Bearer $token');
    print('Body: ${jsonEncode(body)}');

    final response = await http.put(
      Uri.parse(Endpoints.updateUser),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    print('🔽 Resposta [${response.statusCode}]: ${response.body}');

    return response.statusCode == 200;
  }
}
