import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpService {
  static Future<Map<String, dynamic>> getResource(String url,
      {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse(url),
      headers: headers ?? {'Content-Type': 'application/json'},
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  static Future<List<dynamic>> getResources(String url,
      {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse(url),
      headers: headers ?? {'Content-Type': 'application/json'},
    );

    return jsonDecode(response.body) as List<dynamic>;
  }

  static Future<Map<String, dynamic>> put<T extends BaseDto>(String url, T body,
      {Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse(url),
      body: jsonEncode(body.toJson()),
      headers: headers ?? {'Content-Type': 'application/json'},
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> post<T extends BaseDto>(
      String url, T body,
      {Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body.toJson()),
      headers: headers ?? {'Content-Type': 'application/json'},
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  static Future<void> delete(String url, {Map<String, String>? headers}) async {
    await http.delete(
      Uri.parse(url),
      headers: headers ?? {'Content-Type': 'application/json'},
    );
    return;
  }
}
