import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final List<Appointment> appointments;
  AppointmentLoaded(this.appointments);
}

class AppointmentError extends AppointmentState {
  final String message;
  AppointmentError(this.message);
}

class Appointmentloadig extends AppointmentState {}
