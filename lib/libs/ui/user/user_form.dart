import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';

class UserForm extends StatelessWidget {
  final UserModel user;
  final Function(UserModel) onSave;

  UserForm({required this.user, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            initialValue: user.email,
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) {},
          ),
          TextFormField(
            initialValue: user.firstName,
            decoration: InputDecoration(labelText: 'First Name'),
            onChanged: (value) {},
          ),
          TextFormField(
            initialValue: user.lastName,
            decoration: InputDecoration(labelText: 'Last Name'),
            onChanged: (value) {},
          ),
          TextFormField(
            initialValue: user.birthTime.toString(),
            decoration: InputDecoration(labelText: 'Birth Time'),
            onChanged: (value) {},
          ),
          ElevatedButton(
            onPressed: () {
              onSave(
                UserModel(
                  id: user.id,
                  email: user.email,
                  firstName: user.firstName,
                  lastName: user.lastName,
                  birthTime: user.birthTime,
                ),
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
