import 'package:flutter_application_1/libs/data-access/users/state/users_state.dart';
import 'package:flutter_application_1/libs/data-access/users/users_repository.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_effects.dart';
import 'package:injectable/injectable.dart';

@singleton
class UsersEffects extends AbstractListEffects<User, UserFilter, UsersState> {
  UsersEffects({required UsersRepository repository})
      : super(repository: repository, state: UsersState());
}
