import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/repositary/appointment_repos.dart';
import 'package:fpdart/fpdart.dart';

class GetAppointments {
  final AppointmentRepo repo;
  GetAppointments(this.repo);
  Future<Either<Failures, List<Appointment>>> call() => repo.getAll();
}
