import 'package:flutter_application_1/libs/data-access/users/state/users_controller.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_facade.dart';

class UsersFacade implements ListFacade<User> {
  UsersController controller;

  UsersFacade({required this.controller});

  @override
  void load() {
    controller.loadResources();
    return;
  }
}
