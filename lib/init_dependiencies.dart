import 'package:clinic_doctor_interview/features/appointment/data/data_source/appointment_localsource.dart';
import 'package:clinic_doctor_interview/features/appointment/data/models/appointment_model.dart';
import 'package:clinic_doctor_interview/features/appointment/data/repositary/appointment_repos_impl.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/repositary/appointment_repos.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/usecases/fetch_appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/usecases/save_appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_bloc.dart';
import 'package:clinic_doctor_interview/features/auth/data/data_source/superbase_remote.dart';
import 'package:clinic_doctor_interview/features/auth/data/repositary/auth_repositary_impl.dart';
import 'package:clinic_doctor_interview/features/auth/domain/repos/auth_repos.dart';
import 'package:clinic_doctor_interview/features/auth/domain/usecases/currentuser_usecase.dart';
import 'package:clinic_doctor_interview/features/auth/domain/usecases/signupwithemail.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final servicelocater = GetIt.instance;

Future<void> initdependecies() async {
  final supabase = await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InduYXNuanR0c2lhc2lha2R0aWl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM5NjY0NjcsImV4cCI6MjA2OTU0MjQ2N30.am63P2S0tCfS2Plr2Ns9CSPSgBJu3kHHf-nftkw5bnc',
    url: 'https://wnasnjttsiasiakdtiix.supabase.co',
  );

  servicelocater.registerLazySingleton(() => supabase.client);
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([AppointmentModelSchema], directory: dir.path);
  servicelocater.registerLazySingleton<Isar>(() => isar);

  _initAuth();
  _appoint();
}

void _initAuth() {
  servicelocater
    ..registerFactory<Authsuperbase>(() => Authsuperbaseimpl(servicelocater()))
    ..registerFactory<AuthRepos>(() => AuthRepositaryImpl(servicelocater()))
    //usecases
    ..registerFactory(() => Signupwithemail(servicelocater()))
    ..registerFactory(() => CurrentuserUsecase(servicelocater()))
    ..registerLazySingleton(
      () => AuthBloc(
        signupwithemail: servicelocater(),
        currentuserusecase: servicelocater(),
      ),
    );
}

void _appoint() {
  servicelocater
    ..registerFactory<LocalAppointmentDataSource>(
      () => LocalAppointmentDataSourceImpl(servicelocater()),
    )
    ..registerFactory<AppointmentRepo>(
      () => AppointmentRepoImpl(servicelocater()),
    )
    //usecases
    ..registerFactory(() => SaveAppointment(servicelocater()))
    ..registerFactory(() => GetAppointments(servicelocater()))
    ..registerLazySingleton(
      () => AppointmentBloc(
        getAppointments: servicelocater(),
        saveAppointment: servicelocater(),
      ),
    );
}
