import 'package:flutter_application_1/libs/data-access/users/users_repository.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_controller.g.dart';

@riverpod
class AsyncUsers extends _$AsyncUsers {
  @override
  build() {
    return {};
  }

  Future<void> loadResources() async {
    final usersRepository = ref.read(usersRepositoryProvider);

    state = await AsyncValue.guard(() async {
      return await usersRepository
          .loadResources(RequestOptions.defaultRequestOptions<UserFilter>());
    });
  }
}
