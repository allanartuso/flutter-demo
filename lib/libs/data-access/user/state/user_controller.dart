import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_application_1/libs/data-access/user/user_repository.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, UserState>((ref) {
  return UserController(ref.read(userRepositoryProvider));
});

class UserController extends StateNotifier<UserState> {
  final UserRepository userRepository;

  UserController(this.userRepository) : super(UserState());

  Future<void> loadResource(String id) async {
    try {
      final user = await userRepository.loadResource(id);
      state = UserState(resource: user);
    } catch (e) {
      // Handle error appropriately
      print('Error loading user: $e');
      state = UserState(error: 'Error loading user');
    }
  }

  void saveResource(User user) {}
}
