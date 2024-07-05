import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data-model/user/user_model.dart';
import 'user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(const UserState()) {
    on<LoadUserEvent>(_onSubscriptionRequested);
  }

  Future<void> _onSubscriptionRequested(
    LoadUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      final data = await userRepository.getUser(event.id);
      emit(state.copyWith(user: data, isLoading: false));
    } catch (error) {
      emit(state.copyWith(
          user: null, isLoading: false, error: error.toString()));
    }
  }
}
