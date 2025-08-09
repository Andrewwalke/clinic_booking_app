import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecaseabstract<Successtypes, Params> {
  Future<Either<Failures, Successtypes>> call(Params params);
}

class Noparams {}
