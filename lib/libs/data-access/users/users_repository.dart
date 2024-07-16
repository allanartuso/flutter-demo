import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';
import 'package:flutter_application_1/shared/data-model/list/list_repository.dart';
import 'package:injectable/injectable.dart';
import '../../data-model/user/user_model.dart';

@singleton
class UsersRepository extends ListRepository<User, UserFilter> {
  UsersRepository({required HttpService httpService})
      : super(httpService, 'users', User.fromJson);
}
