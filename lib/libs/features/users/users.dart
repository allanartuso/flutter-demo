import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/router.dart';
import 'package:flutter_application_1/libs/data-access/users/users_provider.dart';
import 'package:flutter_application_1/libs/ui/users/users_list_page.dart';
import 'package:go_router/go_router.dart';

class UsersContainer extends StatelessWidget {
  const UsersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return usersProvider(
      context: context,
      initialEvents: (facade) => [facade.load()],
      builder: (context, state, facade) {
        return UsersListPage(
            users: state.resources,
            isLoading: state.isLoading,
            onRowTap: (user, index) {
              GoRouter.of(context).go('${Routes.users}/${user.id}');
            });
      },
    );
  }
}
