import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';

final class UsersState extends ListState<User, UserFilter> {
  UsersState({required List<User> resources, String? error, bool? isLoading})
      : super(
          resources: [],
          error: '',
          isLoading: false,
          requestOptions: RequestOptions.defaultRequestOptions<UserFilter>(),
        );
}
