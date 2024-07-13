import 'package:flutter_application_1/libs/data-access/users/state/users_state.dart';
import 'package:flutter_application_1/libs/data-access/users/users_repository.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_handlers.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@singleton
class UsersController extends GetxController {
  final UsersRepository usersRepository;

  UsersController({required this.usersRepository});

  final UsersState state = UsersState();

  void loadResources() async {
    ListEventHandlers.load(state, usersRepository);
  }
}
