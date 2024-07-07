import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';
import 'package:flutter_application_1/shared/data-model/form/form_repository.dart';
import '../../data-model/user/user_model.dart';
import 'dart:async';

class UserRepository implements FormRepository<User, User> {
  final String url = 'http://localhost:3000/users';

  @override
  Future<User> loadResource(String id) async {
    final response = await HttpService.getResource('$url/$id');
    return User.fromJson(response);
  }

  @override
  Future<User> saveResource(User user) async {
    final String id = user.id;
    final response = await HttpService.put('$url/$id', user);
    return User.fromJson(response);
  }

  @override
  Future<User> createResource(User user) async {
    final response = await HttpService.post(url, user);
    return User.fromJson(response);
  }

  @override
  Future<void> deleteResource(String id) async {
    await HttpService.delete('$url/$id');
  }
}
