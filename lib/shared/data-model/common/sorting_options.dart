enum SortingDirection {
  ascending,
  descending,
  none,
}

const defaultSortingOrder = SortingDirection.ascending;

/// Defines the sorting criterion for a single resource field.
/// Name and sorting order are required.
abstract class SortingField {
  final String field;
  final SortingDirection direction;

  const SortingField(
      {required this.field, this.direction = defaultSortingOrder});
}
