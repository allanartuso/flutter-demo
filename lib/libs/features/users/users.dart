import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/router.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_controller.dart';
import 'package:flutter_application_1/libs/ui/users/users_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UsersContainer extends ConsumerStatefulWidget {
  const UsersContainer({super.key});

  @override
  _UsersContainerState createState() => _UsersContainerState();
}

class _UsersContainerState extends ConsumerState<UsersContainer> {
  @override
  void initState() {
    super.initState();
    ref.read(asyncUsersProvider.notifier).loadResources();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(asyncUsersProvider);
    if (state is AsyncData) {
      print(state.value);

      return UsersListPage(
        users: state.value,
        isLoading: false,
        onRowTap: (user, index) {
          GoRouter.of(context).go('${Routes.users}/${user.id}');
        },
      );
    }
    return UsersListPage(
      users: [],
      isLoading: true,
      onRowTap: (user, index) {
        GoRouter.of(context).go('${Routes.users}/${user.id}');
      },
    );

    return Column(children: <Widget>[
      ElevatedButton(
          onPressed: () {
            ref.read(asyncUsersProvider.notifier).loadResources();
          },
          child: const Text('Load Users')),
    ]);
  }
}
