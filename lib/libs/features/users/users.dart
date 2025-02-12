import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/router.dart';
import 'package:flutter_application_1/libs/data-access/users/users_facade.dart';
import 'package:flutter_application_1/libs/ui/users/users_list_page.dart';
import 'package:flutter_application_1/shared/data-model/common/route.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class UsersContainer extends StatelessWidget implements OnRoute {
  final UsersFacade facade = getIt<UsersFacade>();

  UsersContainer({super.key});

  @override
  onRoute() {
    facade.load();
  }

  @override
  Widget build(BuildContext context) {
    final state = facade.state;

    return Watch(
      (context) => UsersListPage(
        users: state.resources.value,
        isLoading: state.isLoading.value,
        onRowTap: (user, index) {
          GoRouter.of(context).go('${Routes.users}/${user.id}');
        },
      ),
    );
  }
}
