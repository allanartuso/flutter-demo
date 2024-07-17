import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
@JsonSerializable()
class UserModel extends Equatable {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? birthDate;

  UserModel(
      {required this.id,
      required this.email,
      this.firstName,
      required this.lastName,
      this.birthDate});

  UserModel copyWith(
      {String? id,
      String? email,
      String? firstName,
      String? lastName,
      String? birthDate}) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, email, firstName, lastName, birthDate];
}

UserModel _$UserFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] == null ? null : json['firstName'] as String,
      lastName: json['lastName'] == null ? null : json['lastName'] as String,
      birthDate:
          json['birthDate'] == null ? null : (json['birthDate'] as String),
    );

Map<String, dynamic> _$UserToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate,
    };
