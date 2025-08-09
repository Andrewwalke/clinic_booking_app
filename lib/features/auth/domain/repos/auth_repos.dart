import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:clinic_doctor_interview/features/auth/domain/entity/user_entity.dart';

import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepos {
  Future<Either<Failures, String>> signupwithemailotp(String email);
  Future<Either<Failures, UserEntity>> getCurrentUser();
}
