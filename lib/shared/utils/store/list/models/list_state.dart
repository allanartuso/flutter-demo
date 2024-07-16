import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:signals/signals.dart';

abstract class ListState<T, PARAMS> {
  Signal<List<T>> resources;
  Signal<bool> isLoading;
  Signal<String> error;
  Signal<RequestOptions<PARAMS>> requestOptions;

  ListState({
    List<T> initialResources = const [],
    String initialError = '',
    bool initialIsLoading = false,
    RequestOptions<PARAMS>? initialRequestOptions,
  })  : resources = Signal([]),
        error = Signal(initialError),
        isLoading = Signal(initialIsLoading),
        requestOptions = Signal(initialRequestOptions ??
            RequestOptions.defaultRequestOptions<PARAMS>());
}
