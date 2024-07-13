import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class ListState<T, PARAMS> {
  final Rx<List<T>> resources;
  final Rx<bool> isLoading;
  final Rx<String> error;
  final Rx<RequestOptions<PARAMS>> requestOptions;

  const ListState(
      {required this.resources,
      required this.error,
      required this.isLoading,
      required this.requestOptions});
}
