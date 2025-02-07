import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/user/user_facade.dart';
import 'package:flutter_application_1/libs/ui/user/user_form_page.dart';
import 'package:flutter_application_1/shared/data-model/common/route.dart';
import 'package:flutter_application_1/shared/utils/config/injection.dart';
import 'package:signals/signals_flutter.dart';

class UserContainer extends StatelessWidget implements OnRoute {
  final UserFacade facade = getIt<UserFacade>();

  final String id;
  UserContainer({super.key, required this.id});

  @override
  void onRoute() {
    facade.load(id);
  }

  @override
  Widget build(BuildContext context) {
    final state = facade.state;

    return Watch(
      (context) => UserFormPage(
        isLoading: state.isLoading.value,
        user: state.resource.value,
        onSave: (user) {
          facade.save(user);
        },
      ),
    );
  }
}
