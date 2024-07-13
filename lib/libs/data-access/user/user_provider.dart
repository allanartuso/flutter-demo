import 'package:flutter_application_1/libs/data-access/user/state/user_controller.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_facade.dart';

class UsersFacade implements FormFacade<User> {
  UserController controller;

  UsersFacade({required this.controller});

  @override
  void load(String id) {
    controller.loadResource(id);
  }

  @override
  void update(User user) {
    controller.saveResource(user);
  }
}
