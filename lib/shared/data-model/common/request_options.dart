import 'package:flutter_application_1/shared/data-model/common/filtering_options.dart';
import 'package:flutter_application_1/shared/data-model/common/paging_options.dart';
import 'package:flutter_application_1/shared/data-model/common/sorting_options.dart';
import 'package:meta/meta.dart';

class RequestOptions<Params> {
  final PagingOptions pagingOptions;
  final List<SortingField> sortingOptions;
  final FilteringOptions filteringOptions;
  final Params? requestParameters;

  const RequestOptions({
    required this.pagingOptions,
    required this.sortingOptions,
    required this.filteringOptions,
    this.requestParameters,
  });

  @factory
  static RequestOptions<T> defaultRequestOptions<T>() {
    return const RequestOptions(
      pagingOptions: PagingOptions(),
      sortingOptions: [],
      filteringOptions: FilteringOptions(),
    );
  }
}
