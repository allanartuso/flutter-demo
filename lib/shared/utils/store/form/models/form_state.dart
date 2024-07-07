import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FormState<T> extends Equatable {
  final T? resource;
  final String? error;
  final bool isLoading;

  const FormState({this.resource, this.error, this.isLoading = false});

  @override
  List<Object?> get props => [resource, error, isLoading];

  FormState<T> copyWith({
    T? resource,
    String? error,
    bool? isLoading,
  });
}
