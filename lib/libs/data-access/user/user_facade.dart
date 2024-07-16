import 'package:flutter_application_1/libs/data-access/user/state/user_effects.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_facade.dart';

class UsersFacade extends AbstractFormFacade<User, UserState> {
  UsersFacade() : super(effects: getIt<UserEffects>());
}
