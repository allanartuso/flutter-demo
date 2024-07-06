import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data-model/user/user_model.dart';
import '../user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userRepository;

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
}
