import 'package:app_links/app_links.dart';
import 'package:clinic_doctor_interview/core/widgets/main_screen.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_bloc.dart'
    as auth_bloc;
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_event.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/pages/onboarding.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final supabaseClient = Supabase.instance.client;
  final AppLinks _appLinks = AppLinks();

  @override
  void initState() {
    super.initState();
    super.initState();
    context.read<AuthBloc>().add(Getcurrentuserevent());
    _initDeepLinkListener();
  }

  void _initDeepLinkListener() async {
    try {
      final initialUri = await _appLinks.getInitialAppLink();
      if (initialUri != null && initialUri.scheme == 'io.supabase.flutterapp') {
        debugPrint('Initial deep link: $initialUri');
        await _handleSupabaseDeepLink(initialUri);
      }

      _appLinks.uriLinkStream.listen(
        (Uri? uri) async {
          if (uri != null && uri.scheme == 'io.supabase.flutterapp') {
            debugPrint('Live deep link: $uri');
            await _handleSupabaseDeepLink(uri);
          }
        },
        onError: (err) {
          debugPrint('AppLinks stream error: $err');
        },
      );
    } catch (e) {
      debugPrint('AppLinks init error: $e');
    }
  }

  Future<void> _handleSupabaseDeepLink(Uri uri) async {
    try {
      await supabaseClient.auth.getSessionFromUrl(uri);
      context.read<AuthBloc>().add(Getcurrentuserevent());
    } catch (e) {
      debugPrint('Failed to handle Supabase deep link: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, auth_bloc.AuthState>(
        builder: (context, state) {
          print(state);

          if (state is AuthLoading || state is AuthInitial) {
            return Scaffold(
              body: Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Lottie.network(
                    'https://lottie.host/744f2225-8d99-48ab-b6bb-ae5f48575015/dHyyTrCIaJ.lottie',
                  ),
                ),
              ),
            );
          } else if (state is Authenticated) {
            return const MainScreen();
          } else if (state is UnAuthenticated) {
            return const Onboarding();
          } else {
            return const Onboarding();
          }
        },
      ),
    );
  }
}
