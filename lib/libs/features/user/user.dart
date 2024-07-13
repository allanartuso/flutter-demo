import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_controller.dart';
import 'package:flutter_application_1/libs/ui/user/user_form_page.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class UserContainer extends StatelessWidget {
  final String id;
  const UserContainer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final UserController controller = getIt<UserController>();
    final state = controller.state;
    controller.loadResource(id);

    return Obx(
      () => UserFormPage(
        isLoading: state.isLoading.value,
        user: state.resource.value,
        onSave: (user) {
          controller.saveResource(user);
        },
      ),
    );
  }
}
