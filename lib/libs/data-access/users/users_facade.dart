import 'package:flutter_application_1/libs/data-access/users/state/users_effects.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_state.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_facade.dart';
import 'package:injectable/injectable.dart';

@singleton
class UsersFacade extends AbstractListFacade<User, UserFilter, UsersState> {
  UsersFacade({required UsersEffects effects}) : super(effects: effects);
}
