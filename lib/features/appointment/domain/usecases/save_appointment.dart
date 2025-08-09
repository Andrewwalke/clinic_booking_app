import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:clinic_doctor_interview/core/usecases/Usecaseabstract.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/repositary/appointment_repos.dart';
import 'package:fpdart/fpdart.dart';

class SaveAppointment implements Usecaseabstract<void, Appointmentparams> {
  final AppointmentRepo repo;
  SaveAppointment(this.repo);

  @override
  Future<Either<Failures, void>> call(Appointmentparams params) {
    return repo.save(params.appointment);
  }
}

class Appointmentparams {
  final Appointment appointment;

  Appointmentparams(this.appointment);
}
