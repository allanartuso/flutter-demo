import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class FormState<T> {
  final Rx<T?> resource;
  final Rx<String?> error;
  final Rx<bool> isLoading;

  const FormState(
      {required this.resource, required this.error, required this.isLoading});
}
