import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_bloc.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_event.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_state.dart';
import 'package:flutter_application_1/libs/data-access/user/user_repository.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:flutter_application_1/shared/utils/store/form/models/form_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _UserFacade implements FormFacade<User> {
  @override
  LoadUserEvent load(String id) {
    return LoadUserEvent(id: id);
  }

  @override
  UpdateUserEvent update(User user) {
    return UpdateUserEvent(user: user);
  }
}

class _UserFacadeWithBloc implements FormFacade<User> {
  final UserBloc bloc;

  _UserFacadeWithBloc(this.bloc);

  @override
  void load(String id) {
    bloc.add(LoadUserEvent(id: id));
  }

  @override
  void update(User user) {
    bloc.add(UpdateUserEvent(user: user));
  }
}

Widget userProvider({
  required BuildContext context,
  required Widget Function(BuildContext, UserState, _UserFacadeWithBloc)
      builder,
  List<UserEvent> Function(_UserFacade facade)? initialEvents,
}) {
  return RepositoryProvider(
    create: (context) => UserRepository(),
    child: BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepository>(context))
            ..addAll(initialEvents != null ? initialEvents(_UserFacade()) : []),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) => builder(context, state,
            _UserFacadeWithBloc(BlocProvider.of<UserBloc>(context))),
      ),
    ),
  );
}
