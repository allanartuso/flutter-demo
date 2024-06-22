import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? birthTime;

  UserModel(
      {required this.id,
      required this.email,
      this.firstName,
      required this.lastName,
      this.birthTime});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

UserModel _$UserFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] == null ? null : json['firstName'] as String,
      lastName: json['lastName'] == null ? null : json['lastName'] as String,
      birthTime:
          json['birthTime'] == null ? null : (json['birthTime'] as String),
    );

Map<String, dynamic> _$UserToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthTime': instance.birthTime,
    };
