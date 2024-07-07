import 'package:flutter_application_1/shared/data-model/common/filtering_options.dart';

class CompositeSpecSearchCriteria {
  String? key;
  FilteringOperator? operation;
  Object? value;
  FilteringLogic? logic;
  List<CompositeSpecSearchCriteria> filters = [];

  CompositeSpecSearchCriteria({required this.logic, required this.filters});
  CompositeSpecSearchCriteria.criterion(
      {required this.key, required this.value, required this.operation});

  bool isCriterion() {
    return key != null;
  }

  bool isComposite() {
    return logic != null;
  }
}
