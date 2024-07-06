import '../../data-model/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserService {
  Future<User> getUser(String id) async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/users/$id'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return User.fromJson(json);
  }

  Future<User> updateUser(User user) async {
    final String id = user.id;
    final url = Uri.parse('http://localhost:3000/users/$id');
    final response = await http.put(
      url,
      body: jsonEncode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return User.fromJson(json);
  }
}
