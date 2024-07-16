import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/utils/config/app_config.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';

@singleton
class HttpService {
  IConfig config;
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json'
  };

  HttpService(this.config);

  Uri getUrl(String endpoint) {
    return Uri.parse('${config.baseUrl}/$endpoint');
  }

  Future<Map<String, dynamic>> getResource(String url,
      {Map<String, String>? headers}) async {
    final response = await http.get(
      getUrl(url),
      headers: headers ?? defaultHeaders,
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<List<dynamic>> getResources(String url,
      {Map<String, String>? headers}) async {
    final response = await http.get(
      getUrl(url),
      headers: headers ?? defaultHeaders,
    );

    return jsonDecode(response.body) as List<dynamic>;
  }

  Future<Map<String, dynamic>> put<T extends ResourceDto>(String url, T body,
      {Map<String, String>? headers}) async {
    final response = await http.put(
      getUrl(url),
      body: jsonEncode(body.toJson()),
      headers: headers ?? defaultHeaders,
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> post<T extends ResourceDto>(String url, T body,
      {Map<String, String>? headers}) async {
    final response = await http.post(
      getUrl(url),
      body: jsonEncode(body.toJson()),
      headers: headers ?? defaultHeaders,
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<void> delete(String url, {Map<String, String>? headers}) async {
    await http.delete(
      getUrl(url),
      headers: headers ?? defaultHeaders,
    );
    return;
  }
}
