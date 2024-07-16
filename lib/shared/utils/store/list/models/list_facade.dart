import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_effects.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';

abstract class ListFacade<T> {
  load();
}

abstract class AbstractListFacade<RESOURCE extends ResourceDto, PARAMS,
    STATE extends ListState<RESOURCE, PARAMS>> {
  AbstractListEffects<RESOURCE, PARAMS, STATE> effects;

  STATE get state => effects.state;

  AbstractListFacade({required this.effects});

  void load() {
    effects.load();
  }
}
