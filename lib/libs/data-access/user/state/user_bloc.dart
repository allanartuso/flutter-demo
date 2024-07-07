import 'package:flutter_application_1/libs/data-access/user/state/user_event.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(const UserState()) {
    on<LoadUserEvent>((
      LoadUserEvent event,
      Emitter<UserState> emit,
    ) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      try {
        final data = await userRepository.loadResource(event.id);
        emit(state.copyWith(user: data, isLoading: false));
      } catch (error) {
        emit(state.copyWith(
            user: null, isLoading: false, error: error.toString()));
      }
    });

    on<UpdateUserEvent>((
      UpdateUserEvent event,
      Emitter<UserState> emit,
    ) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      try {
        final data = await userRepository.saveResource(event.user);
        emit(state.copyWith(user: data, isLoading: false));
      } catch (error) {
        emit(state.copyWith(
            user: null, isLoading: false, error: error.toString()));
      }
    });
  }

  void addAll(List<UserEvent> events) {
    for (var event in events) {
      add(event);
    }
  }
}
