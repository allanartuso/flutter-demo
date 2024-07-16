import 'package:flutter_application_1/libs/data-access/user/state/user_effects.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_facade.dart';

class UserFacade extends AbstractFormFacade<User, UserState> {
  UserFacade() : super(effects: getIt<UserEffects>());
}
