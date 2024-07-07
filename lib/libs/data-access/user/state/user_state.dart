import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';
import 'package:meta/meta.dart';

@immutable
final class UserState extends FormState<User> {
  const UserState({super.resource, super.error, super.isLoading});

  @override
  UserState copyWith({
    User? resource,
    String? error,
    bool? isLoading,
  }) {
    return UserState(
      resource: resource ?? this.resource,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
