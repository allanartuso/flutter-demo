import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';

final class UserState extends FormState<User> {
  UserState({User? resource, String? error, bool? isLoading})
      : super(resource: null, error: '', isLoading: false);
}
