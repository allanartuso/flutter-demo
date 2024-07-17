import 'package:flutter_application_1/shared/data-model/common/request_options.dart';

abstract class ListState<T, PARAMS> {
  final List<T> resources;
  final bool isLoading;
  final String error;
  final RequestOptions<PARAMS> requestOptions;

  const ListState(
      {required this.resources,
      required this.error,
      required this.isLoading,
      required this.requestOptions});
}
