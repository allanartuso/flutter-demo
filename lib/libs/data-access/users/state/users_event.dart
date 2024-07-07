import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

@immutable
final class LoadUsersEvent extends UsersEvent {
  const LoadUsersEvent();
}
