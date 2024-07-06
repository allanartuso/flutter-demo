import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_bloc.dart';
import 'package:flutter_application_1/libs/data-access/user/user_service.dart';
import 'package:flutter_application_1/libs/ui/user/user_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserService(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<UserService>(context))
              ..add(const LoadUserEvent(id: '1')),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
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
                    BlocProvider.of<UserBloc>(context)
                        .add(UpdateUserEvent(user: user));
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
