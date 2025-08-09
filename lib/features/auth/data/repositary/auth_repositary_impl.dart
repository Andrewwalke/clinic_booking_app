import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:clinic_doctor_interview/features/auth/data/data_source/superbase_remote.dart';
import 'package:clinic_doctor_interview/features/auth/domain/entity/user_entity.dart';

import 'package:clinic_doctor_interview/features/auth/domain/repos/auth_repos.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositaryImpl implements AuthRepos {
  final Authsuperbase authsuperbase;
  AuthRepositaryImpl(this.authsuperbase);
  @override
  Future<Either<Failures, String>> signupwithemailotp(String email) async {
    try {
      await authsuperbase.signupwithemailotp(email);
      return right("OTP sent successfully");
    } catch (e) {
      return left(Failures("OTP sent failed : ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() async {
    try {
      final user = await authsuperbase.getcurrentuser();

      return right(user);
    } catch (e) {
      return left(Failures("Error${e.toString()}"));
    }
  }
}
