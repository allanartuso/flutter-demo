import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/router.dart';
import 'package:flutter_application_1/libs/data-access/users/users_provider.dart';
import 'package:flutter_application_1/libs/ui/users/users_list.dart';
import 'package:go_router/go_router.dart';

class UsersContainer extends StatelessWidget {
  const UsersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return usersProvider(
      context: context,
      initialEvents: (facade) => [facade.load()],
      builder: (context, state, facade) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final users = state.resources;
        if (users.isEmpty) {
          return const Center(
            child: Text('No users found'),
          );
        } else {
          return UsersList(
              users: users,
              onRowTap: (user, index) {
                GoRouter.of(context).go('${Routes.users}/${user.id}');
              });
        }
      },
    );
  }
}
