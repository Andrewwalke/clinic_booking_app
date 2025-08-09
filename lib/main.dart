import 'package:clinic_doctor_interview/core/observers/supabase_auth_observer.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_bloc.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clinic_doctor_interview/init_dependiencies.dart';
import 'package:clinic_doctor_interview/initialize_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase and other dependencies
  await initdependecies();

  // Get the AuthBloc instance from your service locator
  final authBloc = servicelocater<AuthBloc>();

  // Initialize SupabaseAuthObserver if you have it (optional)
  SupabaseAuthObserver(authBloc);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => servicelocater<AuthBloc>()),
        BlocProvider<AppointmentBloc>(
          create: (_) => servicelocater<AppointmentBloc>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}
