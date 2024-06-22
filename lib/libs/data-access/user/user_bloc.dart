import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data-model/user/user_model.dart';
import 'user_repo.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserState(
        isLoading: true,
      ));
      try {
        final data = await userRepository.getUser('0');
        emit(UserState(user: data, isLoading: false));
      } catch (error) {
        emit(UserState(user: null, isLoading: false, error: error.toString()));
      }
    });
  }
}
