import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';
import 'package:flutter_application_1/shared/data-model/form/form_service.dart';
import '../../data-model/user/user_model.dart';
import 'dart:async';

class UserRepository implements FormService<User, User> {
  @override
  Future<User> loadResource(String id) async {
    final response = await HttpService.get('http://localhost:3000/users/$id');
    return User.fromJson(response);
  }

  @override
  Future<User> saveResource(User user) async {
    final String id = user.id;
    final response = await HttpService.put(
      'http://localhost:3000/users/$id',
      user,
    );

    return User.fromJson(response);
  }

  @override
  Future<User> createResource(User user) async {
    final response = await HttpService.post(
      'http://localhost:3000/users',
      user,
    );

    return User.fromJson(response);
  }

  @override
  Future<void> deleteResource(String id) async {
    await HttpService.delete('http://localhost:3000/users/$id');

    return;
  }
}
