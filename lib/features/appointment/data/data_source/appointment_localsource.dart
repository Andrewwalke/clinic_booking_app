import 'package:clinic_doctor_interview/features/appointment/data/models/appointment_model.dart';
import 'package:isar/isar.dart';

abstract class LocalAppointmentDataSource {
  Future<void> save(AppointmentModel model);
  Future<List<AppointmentModel>> getAll();
}

class LocalAppointmentDataSourceImpl implements LocalAppointmentDataSource {
  final Isar isar;

  LocalAppointmentDataSourceImpl(this.isar);

  @override
  Future<void> save(AppointmentModel model) async {
    await isar.writeTxn(() => isar.appointmentModels.put(model));
  }

  @override
  Future<List<AppointmentModel>> getAll() async {
    return await isar.appointmentModels.where().findAll();
  }
}
