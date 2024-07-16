import 'package:flutter_application_1/libs/data-access/users/state/users_effects.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_state.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_facade.dart';

class UsersFacade extends AbstractListFacade<User, UserFilter, UsersState> {
  UsersFacade() : super(effects: getIt<UsersEffects>());
}
