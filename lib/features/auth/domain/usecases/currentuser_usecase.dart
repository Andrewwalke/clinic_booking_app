import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:clinic_doctor_interview/core/usecases/Usecaseabstract.dart';
import 'package:clinic_doctor_interview/features/auth/domain/entity/user_entity.dart';
import 'package:clinic_doctor_interview/features/auth/domain/repos/auth_repos.dart';
import 'package:fpdart/fpdart.dart';

class CurrentuserUsecase implements Usecaseabstract<UserEntity, Noparams> {
  final AuthRepos authrepos;

  CurrentuserUsecase(this.authrepos);
  @override
  Future<Either<Failures, UserEntity>> call(Noparams params) async {
    return await authrepos.getCurrentUser();
  }
}
