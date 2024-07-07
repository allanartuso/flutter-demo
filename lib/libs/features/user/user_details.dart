import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/user/user_provider.dart';
import 'package:flutter_application_1/libs/ui/user/user_form.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return userProvider(
      context: context,
      initialEvents: (facade) => [facade.load('1')],
      builder: (context, state, facade) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final user = state.user;
        if (null == user) {
          return const Center(
            child: Text('User not found'),
          );
        } else {
          return Center(
            child: UserForm(
              user: user,
              onSave: (user) {
                facade.update(user);
              },
            ),
          );
        }
      },
    );
  }
}
