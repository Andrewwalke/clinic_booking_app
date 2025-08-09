import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:clinic_doctor_interview/core/usecases/Usecaseabstract.dart';
import 'package:clinic_doctor_interview/features/auth/domain/repos/auth_repos.dart';
import 'package:fpdart/fpdart.dart';

class Signupwithemail implements Usecaseabstract<String, Usersignupparams> {
  final AuthRepos authRepos;

  Signupwithemail(this.authRepos);
  @override
  Future<Either<Failures, String>> call(Usersignupparams params) async {
    return await authRepos.signupwithemailotp(params.email);
  }
}

class Usersignupparams {
  final String email;

  Usersignupparams({required this.email});
}
