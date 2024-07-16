import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/data-model/list/list_repository.dart';
import 'package:flutter_application_1/shared/utils/store/list/list_handlers.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';

abstract class AbstractListEffects<RESOURCE extends ResourceDto, PARAMS,
    STATE extends ListState<RESOURCE, PARAMS>> {
  final ListRepository<RESOURCE, PARAMS> repository;
  final STATE state;

  AbstractListEffects({required this.repository, required this.state});

  void load() async {
    ListEventHandlers.load(state, repository);
  }
}
