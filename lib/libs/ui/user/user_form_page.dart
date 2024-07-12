import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/libs/ui/user/user_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserFormPage extends StatefulWidget {
  final User? user;
  final bool isLoading;
  final Function(User) onSave;

  const UserFormPage(
      {super.key,
      required this.user,
      required this.isLoading,
      required this.onSave});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final user = widget.user;
    final i18n = AppLocalizations.of(context)!;

    if (null == user) {
      return Center(
        child: Text(i18n.user_form_notFound),
      );
    } else {
      return Center(child: UserForm(user: user, onSave: widget.onSave));
    }
  }
}
