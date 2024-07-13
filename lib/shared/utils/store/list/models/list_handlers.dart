import 'package:flutter_application_1/shared/data-model/list/list_repository.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';

class ListEventHandlers {
  static void load<T, PARAMS>(
    ListState<T, PARAMS> state,
    ListRepository<T, PARAMS> repository,
  ) async {
    state.isLoading(true);

    try {
      final data = await repository.loadResources(state.requestOptions.value);
      state.resources(data);
    } catch (error) {
      print(error);
      state.error(error.toString());
    } finally {
      state.isLoading(false);
    }
  }
}
