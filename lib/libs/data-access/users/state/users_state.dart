import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';
import 'package:meta/meta.dart';

@immutable
final class UsersState extends ListState<User, UserFilter> {
  const UsersState(
      {super.resources, super.error, super.isLoading, super.requestOptions});

  @override
  UsersState copyWith({
    List<User>? resources,
    String? error,
    bool? isLoading,
  }) {
    return UsersState(
      resources: resources ?? this.resources,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
