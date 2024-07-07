import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:meta/meta.dart';

@immutable
sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

@immutable
final class InitialUserEvent extends UserEvent {}

@immutable
final class LoadUserEvent extends UserEvent {
  final String id;

  const LoadUserEvent({required this.id});
}

@immutable
final class UpdateUserEvent extends UserEvent {
  final User user;

  const UpdateUserEvent({required this.user});
}
