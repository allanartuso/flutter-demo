import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_application_1/libs/data-access/user/user_repository.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_handlers.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserController extends GetxController {
  final UserRepository userRepository;

  UserController({required this.userRepository});

  final UserState state = UserState();

  void loadResource(String id) async {
    FormEventHandlers.load(state, userRepository, id);
  }

  void saveResource(User user) async {
    FormEventHandlers.save(state, userRepository, user);
  }
}
