import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/user/user_provider.dart';
import 'package:flutter_application_1/libs/ui/user/user_form_page.dart';

class UserContainer extends StatelessWidget {
  final String id;
  const UserContainer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return userProvider(
      context: context,
      initialEvents: (facade) => [facade.load(id)],
      builder: (context, state, facade) {
        return Center(
          child: UserFormPage(
            isLoading: state.isLoading,
            user: state.resource,
            onSave: (user) {
              facade.update(user);
            },
          ),
        );
      },
    );
  }
}
