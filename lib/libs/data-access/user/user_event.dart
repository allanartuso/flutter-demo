part of 'user_bloc.dart';

@immutable
sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

@immutable
final class LoadUserEvent extends UserEvent {
  final String id;

  const LoadUserEvent({required this.id});
}
