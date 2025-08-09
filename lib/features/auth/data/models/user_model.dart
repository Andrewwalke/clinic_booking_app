import 'package:clinic_doctor_interview/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(id: map['id'] ?? '', email: map['email'] ?? '');
  }
}
