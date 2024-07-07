import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';

class UsersList extends StatelessWidget {
  final List<User> users;
  final void Function(User user, int index)? onRowTap;

  const UsersList({super.key, required this.users, this.onRowTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.firstName ?? user.email),
          subtitle: Text(user.email),
          onTap: () {
            if (onRowTap != null) {
              onRowTap!(user, index);
            }
          },
        );
      },
    );
  }
}
