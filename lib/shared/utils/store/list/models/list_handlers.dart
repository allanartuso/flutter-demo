import 'package:flutter_application_1/shared/data-model/list/list_repository.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';
import 'package:signals/signals.dart';

class ListEventHandlers {
  static void load<T, PARAMS>(
    ListState<T, PARAMS> state,
    ListRepository<T, PARAMS> repository,
  ) async {
    state.isLoading.value = true;

    try {
      final data = await repository.loadResources(state.requestOptions.value);
      batch(() {
        state.resources.value = data;
        state.isLoading.value = false;
      });
    } catch (error) {
      batch(() {
        state.error.value = error.toString();
        state.isLoading.value = false;
      });
    }
  }
}
