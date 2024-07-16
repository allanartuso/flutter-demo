import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_effects.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';

abstract class AbstractFormFacade<RESOURCE extends ResourceDto,
    STATE extends FormState<RESOURCE>> {
  AbstractFormEffects<RESOURCE, STATE> effects;

  STATE get state => effects.state;

  AbstractFormFacade({required this.effects});

  void load(String id) {
    effects.load(id);
  }

  void save(RESOURCE user) {
    effects.save(user);
  }
}
