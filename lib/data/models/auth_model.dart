import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({required super.email, super.uid});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(email: json['email'] ?? '', uid: json['uid']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'uid': uid};
  }
}
