import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';
import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:flutter_application_1/shared/data-model/list/list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data-model/user/user_model.dart';
import 'dart:async';

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final httpService = ref.read(httpServiceProvider);
  return UsersRepository(httpService);
});

class UsersRepository implements ListRepository<User, UserFilter> {
  final String url = 'users';
  final HttpService httpService;

  UsersRepository(this.httpService);

  @override
  Future<List<User>> loadResources(RequestOptions<UserFilter> params) async {
    final responses = await httpService.getResources(url);

    return responses.map((response) => User.fromJson(response)).toList();
  }
}
