abstract class FormState<T> {
  final T? resource;
  final String? error;
  final bool isLoading;

  const FormState(
      {required this.resource, required this.error, required this.isLoading});
}
