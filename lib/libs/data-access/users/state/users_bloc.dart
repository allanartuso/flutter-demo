import 'package:flutter_application_1/libs/data-access/users/state/users_event.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_state.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_bloc.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_bloc.dart';
import 'package:injectable/injectable.dart';
import '../users_repository.dart';

@injectable
class UsersBloc extends FormBloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc(this.usersRepository) : super(const UsersState()) {
    on<LoadUsersEvent>((event, emit) {
      return ListEventHandlers.load(state, usersRepository, emit);
    });
  }
}
