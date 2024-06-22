part of 'user_bloc.dart';

class UserEvent {}

class LoadUserEvent extends UserEvent {
  final String id;

  LoadUserEvent({required this.id});
}
