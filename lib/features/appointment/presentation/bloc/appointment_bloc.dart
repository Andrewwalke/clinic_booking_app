import 'package:clinic_doctor_interview/features/appointment/domain/usecases/fetch_appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/usecases/save_appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_event.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final SaveAppointment saveAppointment;
  final GetAppointments getAppointments;

  AppointmentBloc({
    required this.saveAppointment,
    required this.getAppointments,
  }) : super(AppointmentInitial()) {
    on<AddAppointment>((event, emit) async {
      final result = await saveAppointment(
        Appointmentparams(event.appointment),
      );

      await result.fold(
        (failure) async => emit(AppointmentError("Failed to save appointment")),
        (_) async {
          final all = await getAppointments();
          await all.fold(
            (failure) async => emit(AppointmentError(failure.message)),
            (appointments) async => emit(AppointmentLoaded(appointments)),
          );
        },
      );
    });

    on<LoadAppointments>((event, emit) async {
      emit(Appointmentloadig());
      final result = await getAppointments();
      await result.fold(
        (failure) async =>
            emit(AppointmentError("Failed to load appointments")),
        (appointments) async => emit(AppointmentLoaded(appointments)),
      );
    });
  }
}
