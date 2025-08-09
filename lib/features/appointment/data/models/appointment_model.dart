import 'package:isar/isar.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';

part 'appointment_model.g.dart';

@collection
class AppointmentModel {
  Id id = Isar.autoIncrement;
  late String doctorName;
  late String hospitalName;
  late String specialty;
  late String imageUrl;
  late String date;
  late String time;
  late int price;

  Appointment toEntity() => Appointment(
    id: id,
    doctorName: doctorName,
    specialty: specialty,
    imageUrl: imageUrl,
    date: date,
    time: time,
    price: price,
    hospitalName: hospitalName,
  );

  static AppointmentModel fromEntity(Appointment a) => AppointmentModel()
    ..id = a.id
    ..doctorName = a.doctorName
    ..specialty = a.specialty
    ..imageUrl = a.imageUrl
    ..date = a.date
    ..time = a.time
    ..price = a.price
    ..hospitalName = a.hospitalName;
}
