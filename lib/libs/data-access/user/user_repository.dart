import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';
import 'package:flutter_application_1/shared/data-model/form/form_repository.dart';
import 'package:injectable/injectable.dart';
import '../../data-model/user/user_model.dart';

@singleton
class UserRepository extends FormRepository<User, User> {
  UserRepository({required HttpService httpService})
      : super(httpService, 'users', User.fromJson);
}
