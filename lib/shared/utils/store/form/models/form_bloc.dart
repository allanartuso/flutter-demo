import 'package:flutter_application_1/shared/data-model/form/form_repository.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FormBloc<Event, State> extends Bloc<Event, State> {
  FormBloc(super.initialState);

  void addAll(List<Event> events) {
    for (var event in events) {
      add(event);
    }
  }
}

class FormEventHandlers {
  static void load<T, C>(FormState<T> state, FormRepository<T, C> repository,
      Emitter<FormState<T>> emit, String id) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      final data = await repository.loadResource(id);
      emit(state.copyWith(resource: data, isLoading: false));
    } catch (error) {
      print(error);
      emit(state.copyWith(
          resource: null, isLoading: false, error: error.toString()));
    }
  }

  static void save<T, C>(FormState<T> state, FormRepository<T, C> repository,
      Emitter<FormState<T>> emit, T resource) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      final data = await repository.saveResource(resource);
      emit(state.copyWith(resource: data, isLoading: false));
    } catch (error) {
      print(error);
      emit(state.copyWith(
          resource: null, isLoading: false, error: error.toString()));
    }
  }
}
