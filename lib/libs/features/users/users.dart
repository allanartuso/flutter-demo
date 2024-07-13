import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/router.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_controller.dart';
import 'package:flutter_application_1/libs/ui/users/users_list_page.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';

class UsersContainer extends StatelessWidget {
  const UsersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersController controller = getIt<UsersController>();
    final state = controller.state;

    controller.loadResources();

    return Obx(
      () => UsersListPage(
          users: state.resources.value,
          isLoading: state.isLoading.value,
          onRowTap: (user, index) {
            GoRouter.of(context).go('${Routes.users}/${user.id}');
          }),
    );
  }
}
