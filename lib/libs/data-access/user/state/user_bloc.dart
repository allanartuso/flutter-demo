import 'package:flutter_application_1/libs/data-access/user/state/user_event.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_bloc.dart';
import 'package:injectable/injectable.dart';
import '../user_repository.dart';

@injectable
class UserBloc extends FormBloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(const UserState()) {
    on<LoadUserEvent>((event, emit) {
      return FormEventHandlers.load(state, userRepository, emit, event.id);
    });

    on<UpdateUserEvent>((event, emit) {
      return FormEventHandlers.save(state, userRepository, emit, event.user);
    });
  }
}
