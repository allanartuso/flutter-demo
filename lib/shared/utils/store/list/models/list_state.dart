import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/shared/data-model/common/filtering_options.dart';
import 'package:flutter_application_1/shared/data-model/common/paging_options.dart';
import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListState<T, PARAMS> extends Equatable {
  final List<T> resources;
  final bool isLoading;
  final String? error;
  final RequestOptions<PARAMS> requestOptions;

  const ListState(
      {this.resources = const [],
      this.isLoading = false,
      this.error,
      this.requestOptions = const RequestOptions(
        pagingOptions: PagingOptions(),
        sortingOptions: [],
        filteringOptions: FilteringOptions(),
      )});

  @override
  List<Object?> get props => [resources, error, isLoading];

  ListState<T, PARAMS> copyWith({
    List<T>? resources,
    String? error,
    bool isLoading = false,
  });
}
