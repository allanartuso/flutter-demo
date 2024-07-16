import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_effects.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';

abstract class AbstractFormFacade<RESOURCE extends ResourceDto,
    STATE extends FormState<RESOURCE>> {
  AbstractEffects<RESOURCE, STATE> effects;

  AbstractFormFacade({required this.effects});

  void load(String id) {
    effects.loadResource(id);
  }

  void update(RESOURCE user) {
    effects.saveResource(user);
  }
}
