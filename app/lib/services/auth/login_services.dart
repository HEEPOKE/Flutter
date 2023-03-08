import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static final String baseUrl = dotenv.env['ENDPOINT_URL']!;

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final body = jsonEncode(data);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'payload': json.decode(response.body)['payload']
      };
    } else {
      return {'success': false, 'error': json.decode(response.body)['message']};
    }
  }
}
