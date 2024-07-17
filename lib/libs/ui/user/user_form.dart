import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/ui/form/input.dart';
import 'package:flutter_application_1/shared/ui/layout/gap.dart';
import 'package:form_validator/form_validator.dart';

class UserForm extends StatefulWidget {
  final UserModel user;
  final Function(UserModel) onSave;

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

  List<Widget> _buildForm() {
    return [
      DemoTextFormField(
          controller: _emailController,
          labelText: 'Email',
          validator: ValidationBuilder().email().build()),
      DemoTextFormField(
        controller: _firstNameController,
        labelText: 'First Name',
        validator: ValidationBuilder().required().build(),
      ),
      DemoTextFormField(
        controller: _lastNameController,
        labelText: 'Last Name',
      ),
      DemoTextFormField(
        controller: _birthDateController,
        labelText: 'Birth Date',
      ),
      FilledButton(
        onPressed: () {
          final user = UserModel(
            id: widget.user.id,
            email: _emailController.text,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            birthDate: _birthDateController.text,
          );
          widget.onSave(user);
        },
        child: const Text('Save'),
      ),
    ];
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: gap(children: _buildForm()),
      ),
    );
  }
}
