import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/data-model/form/form_repository.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';
import 'package:signals/signals.dart';

class FormEventHandlers {
  static void load<T extends ResourceDto, C extends ResourceDto>(
      FormState<T> state, FormRepository<T, C> repository, String id) async {
    state.isLoading.value = true;

    try {
      final data = await repository.loadResource(id);
      batch(() {
        state.resource.value = data;
        state.isLoading.value = false;
      });
    } catch (error) {
      batch(() {
        state.error.value = error.toString();
        state.isLoading.value = false;
      });
    }
  }

  static void save<T extends ResourceDto, C extends ResourceDto>(
      FormState<T> state, FormRepository<T, C> repository, T resource) async {
    state.isLoading.value = true;
    try {
      final data = await repository.saveResource(resource);
      batch(() {
        state.resource.value = data;
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
