import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

final class UserState extends FormState<User> {
  UserState() : super(resource: Rx(null), error: Rx(''), isLoading: Rx(false));
}
