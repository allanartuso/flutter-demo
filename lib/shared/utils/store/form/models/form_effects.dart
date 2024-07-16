import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/data-model/form/form_repository.dart';
import 'package:flutter_application_1/shared/utils/store/form/form_handlers.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';

abstract class AbstractFormEffects<RESOURCE extends ResourceDto,
    STATE extends FormState<RESOURCE>> {
  final FormRepository<RESOURCE, RESOURCE> repository;
  final STATE state;

  AbstractFormEffects({required this.repository, required this.state});

  void load(String id) async {
    FormEventHandlers.load(state, repository, id);
  }

  void save(RESOURCE resource) async {
    FormEventHandlers.save(state, repository, resource);
  }
}
