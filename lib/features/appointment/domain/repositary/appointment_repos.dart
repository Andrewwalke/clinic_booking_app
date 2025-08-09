import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clinic_doctor_interview/core/errors/failures.dart';

abstract class AppointmentRepo {
  Future<Either<Failures, void>> save(Appointment appointment);
  Future<Either<Failures, List<Appointment>>> getAll();
}
