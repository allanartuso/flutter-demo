import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/libs/ui/users/users_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsersListPage extends StatefulWidget {
  final List<User> users;
  final bool isLoading;
  final void Function(User, int)? onRowTap;

  const UsersListPage(
      {super.key, required this.users, required this.isLoading, this.onRowTap});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final users = widget.users;
    final i18n = AppLocalizations.of(context)!;

    if (users.isEmpty) {
      return Center(
        child: Text(i18n.users_list_notFound),
      );
    } else {
      return UsersList(users: users, onRowTap: widget.onRowTap);
    }
  }
}
