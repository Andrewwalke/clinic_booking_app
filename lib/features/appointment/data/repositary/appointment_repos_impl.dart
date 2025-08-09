import 'package:clinic_doctor_interview/features/appointment/data/data_source/appointment_localsource.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';

import 'package:clinic_doctor_interview/core/errors/failures.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/repositary/appointment_repos.dart';
import 'package:fpdart/fpdart.dart';

import '../models/appointment_model.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final LocalAppointmentDataSource local;

  AppointmentRepoImpl(this.local);

  @override
  Future<Either<Failures, List<Appointment>>> getAll() async {
    try {
      final models = await local.getAll();
      print('DEBUG: fetched ${models.length} appointment models');
      final appointments = models.map((m) => m.toEntity()).toList();
      print('DEBUG: mapped to entities count: ${appointments.length}');
      return Right(appointments);
    } catch (e) {
      print('ERROR in getAll: $e');
      return Left(Failures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> save(Appointment appointment) async {
    try {
      final model = AppointmentModel.fromEntity(appointment);
      await local.save(model);
      print('DEBUG: savings $model appointment models');
      return const Right(null);
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}
