import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/libs/data-model/user/user_model.dart';
import 'package:meta/meta.dart';

@immutable
final class UserState extends Equatable {
  const UserState({this.user, this.error, this.isLoading = false});

  final User? user;
  final String? error;
  final bool isLoading;

  @override
  List<Object?> get props => [user, error, isLoading];

  UserState copyWith({
    User? user,
    String? error,
    bool? isLoading,
  }) {
    return UserState(
      user: user ?? this.user,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
