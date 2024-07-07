enum FilteringLogic {
  and,
  or,
}

const defaultFilteringLogic = FilteringLogic.and;

enum FilteringOperator {
  equal,
  notEqual,
  lessThan,
  lessThanOrEqual,
  greaterThan,
  greaterThanOrEqual,
  startsWith,
  endsWith,
  contains,
}

const defaultFilteringOperator = FilteringOperator.equal;

abstract class FilteringItem {
  bool isCriterion();
  bool isComposite();
}

class FilteringField implements FilteringItem {
  final String field;
  final String value;
  final FilteringOperator operator;

  FilteringField({
    required this.field,
    required this.value,
    required this.operator,
  });

  @override
  bool isCriterion() {
    return true;
  }

  @override
  bool isComposite() {
    return false;
  }
}

class FilteringOptions implements FilteringItem {
  final List<FilteringItem> filters;
  final FilteringLogic logic;

  const FilteringOptions({
    this.filters = const [],
    this.logic = defaultFilteringLogic,
  });

  @override
  bool isCriterion() {
    return false;
  }

  @override
  bool isComposite() {
    return true;
  }
}
