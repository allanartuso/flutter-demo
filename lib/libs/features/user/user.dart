import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/data-access/user/state/user_controller.dart';
import 'package:flutter_application_1/libs/data-access/user/user_repository.dart';
import 'package:flutter_application_1/libs/ui/user/user_form_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserContainer extends ConsumerWidget {
  final String id;
  const UserContainer({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(userRepositoryProvider);
    final state = controller.loadResource(id);

    return Center(
      /// Since network-requests are asynchronous and can fail, we need to
      /// handle both error and loading states. We can use pattern matching for this.
      /// We could alternatively use `if (activity.isLoading) { ... } else if (...)`
      child: switch (state) {
        AsyncData(:final value) => Text('Activity: ${value}'),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
