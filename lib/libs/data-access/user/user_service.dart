import '../../data-model/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserService {
  Future<UserModel> getUser(String id) async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/users/$id'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return UserModel.fromJson(json);
  }
}
