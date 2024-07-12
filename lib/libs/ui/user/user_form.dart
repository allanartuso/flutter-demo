import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/ui/form/input.dart';
import 'package:flutter_application_1/shared/ui/layout/gap.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserForm extends StatefulWidget {
  final User user;
  final Function(User) onSave;

  const UserForm({super.key, required this.user, required this.onSave});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.user.email;
    _firstNameController.text = widget.user.firstName ?? '';
    _lastNameController.text = widget.user.lastName ?? '';
    _birthDateController.text = widget.user.birthDate ?? '';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final i18n = AppLocalizations.of(context)!;

    return Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: gap(children: [
              DemoTextFormField(
                controller: _emailController,
                labelText: i18n.user_form_email,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              DemoTextFormField(
                controller: _firstNameController,
                labelText: i18n.user_form_firstName,
                validator: FormBuilderValidators.required(),
              ),
              DemoTextFormField(
                controller: _lastNameController,
                labelText: i18n.user_form_lastName,
              ),
              DemoTextFormField(
                controller: _birthDateController,
                labelText: i18n.user_form_birthDate,
              ),
              FilledButton(
                onPressed: () {
                  final updatedUser = User(
                    id: widget.user.id,
                    email: _emailController.text,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    birthDate: _birthDateController.text,
                  );
                  widget.onSave(updatedUser);
                },
                child: Text(i18n.common_button_save),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
