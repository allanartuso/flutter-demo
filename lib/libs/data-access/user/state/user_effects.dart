import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_application_1/libs/data-access/user/user_repository.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_effects.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserEffects extends AbstractEffects<User, UserState> {
  UserEffects({required UserRepository repository})
      : super(repository: repository, state: UserState());
}
