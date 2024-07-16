import 'package:signals/signals.dart';

abstract class FormState<T> {
  Signal<T?> resource;
  Signal<bool> isLoading;
  Signal<String> error;

  FormState({
    List<T> initialResources = const [],
    String initialError = '',
    bool initialIsLoading = false,
  })  : resource = Signal(null),
        error = Signal(initialError),
        isLoading = Signal(initialIsLoading);
}
