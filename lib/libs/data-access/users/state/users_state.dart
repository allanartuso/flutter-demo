import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_state.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

final class UsersState extends ListState<User, UserFilter> {
  UsersState()
      : super(
            resources: Rx([]),
            error: Rx(''),
            isLoading: Rx(false),
            requestOptions:
                Rx(RequestOptions.defaultRequestOptions<UserFilter>()));
}
