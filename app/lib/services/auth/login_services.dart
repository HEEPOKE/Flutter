import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final url = Uri.parse('${dotenv.env['API_URL']}/api/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['payload'];

      return {'success': true, 'data': data};
    } else {
      final error = jsonDecode(response.body)['message'];

      return {'success': false, 'error': error};
    }
  }
}
