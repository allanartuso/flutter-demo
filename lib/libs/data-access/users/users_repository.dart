import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';
import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:flutter_application_1/shared/data-model/list/list_repository.dart';
import '../../data-model/user/user_model.dart';
import 'dart:async';

class UsersRepository implements ListRepository<User, UserFilter> {
  final String url = 'http://localhost:3000/users';

  @override
  Future<List<User>> loadResources(RequestOptions<UserFilter> params) async {
    final responses = await HttpService.getResources(url);

    return responses.map((response) => User.fromJson(response)).toList();
  }
}
