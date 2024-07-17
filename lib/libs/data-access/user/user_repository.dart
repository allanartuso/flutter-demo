import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';
import 'package:flutter_application_1/shared/data-model/form/form_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data-model/user/user_model.dart';
import 'dart:async';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final httpService = ref.read(httpServiceProvider);
  return UserRepository(httpService);
});

class UserRepository implements FormRepository<User, User> {
  final String url = 'users';
  final HttpService httpService;

  UserRepository(this.httpService);

  @override
  Future<User> loadResource(String id) async {
    final response = await httpService.getResource('$url/$id');
    return User.fromJson(response);
  }

  @override
  Future<User> saveResource(User user) async {
    final String id = user.id;
    final response = await httpService.put('$url/$id', user);
    return User.fromJson(response);
  }

  @override
  Future<User> createResource(User user) async {
    final response = await httpService.post(url, user);
    return User.fromJson(response);
  }

  @override
  Future<void> deleteResource(String id) async {
    await httpService.delete('$url/$id');
  }
}
