import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_bloc.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_event.dart';
import 'package:flutter_application_1/libs/data-access/users/state/users_state.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:flutter_application_1/shared/utils/store/list/models/list_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersFacade implements ListFacade<User> {
  @override
  LoadUsersEvent load() {
    return const LoadUsersEvent();
  }
}

class UsersFacadeWithBloc implements ListFacade<User> {
  final UsersBloc bloc;

  UsersFacadeWithBloc(this.bloc);

  @override
  void load() {
    bloc.add(const LoadUsersEvent());
  }
}

Widget usersProvider({
  required BuildContext context,
  required Widget Function(BuildContext, UsersState, UsersFacadeWithBloc)
      builder,
  List<UsersEvent> Function(UsersFacade facade)? initialEvents,
}) {
  return BlocProvider(
    create: (_) => getIt<UsersBloc>()
      ..addAll(initialEvents != null ? initialEvents(UsersFacade()) : []),
    child: BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return builder(context, state,
            UsersFacadeWithBloc(BlocProvider.of<UsersBloc>(context)));
      },
    ),
  );
}
