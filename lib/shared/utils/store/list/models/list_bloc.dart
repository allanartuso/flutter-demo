import 'package:flutter_application_1/shared/data-model/list/list_repository.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ListBloc<Event, State> extends Bloc<Event, State> {
  ListBloc(super.initialState);

  void addAll(List<Event> events) {
    for (var event in events) {
      add(event);
    }
  }
}

class ListEventHandlers {
  static void load<T, PARAMS>(
      ListState<T, PARAMS> state,
      ListRepository<T, PARAMS> repository,
      Emitter<ListState<T, PARAMS>> emit) async {
    emit(state.copyWith(
      resources: [],
      isLoading: true,
    ));

    try {
      final data = await repository.loadResources(state.requestOptions);
      emit(state.copyWith(resources: data, isLoading: false));
    } catch (error) {
      print(error);
      emit(state
          .copyWith(resources: [], isLoading: false, error: error.toString()));
    }
  }
}
