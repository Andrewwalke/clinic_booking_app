import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_event.dart';

class SupabaseAuthObserver {
  final AuthBloc authBloc;

  SupabaseAuthObserver(this.authBloc) {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      final session = data.session;

      if (event == AuthChangeEvent.signedIn && session != null) {
        authBloc.add(Getcurrentuserevent());
      }
    });
  }
}
