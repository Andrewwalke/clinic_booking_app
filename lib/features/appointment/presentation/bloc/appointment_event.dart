import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';

abstract class AppointmentEvent {}

class AddAppointment extends AppointmentEvent {
  final Appointment appointment;
  AddAppointment(this.appointment);
}

class LoadAppointments extends AppointmentEvent {}
