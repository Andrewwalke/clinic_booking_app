import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_event.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(Getcurrentuserevent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (!_hasNavigated && state is Authenticated) {
            _hasNavigated = true;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Home()),
            );
          } else if (state is UnAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "User not verified. Vertify using link sent to Email",
                ),
              ),
            );
          } else if (state is OtpsentFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Lottie.network(
                    'https://lottie.host/2a9ca41b-cb10-47cd-bf22-2e8c85493001/cAu9ODixxG.json',
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.all(14),
                  child: const Text(
                    'Verifying your email... If you didn\'t Vertify using link sent to Email , vertify using that and login ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
