import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_event.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/pages/vertification_page.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/widgets/auth_button.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/widgets/login_textfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldbackgroundcolor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Name
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Doctors',
                          style: TextStyle(
                            color: CustomColors.styledtextcolor1,
                          ),
                        ),
                        TextSpan(
                          text: 'Space',
                          style: TextStyle(
                            color: CustomColors.styledtextcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    'Welcome to\nDoctorsSpace login now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.textcolor1,
                    ),
                  ),
                  const SizedBox(height: 32),
                  LoginTextfield(emailController: emailController),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (val) {}),
                          const Text('Remember me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forget password?'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Login Button
                  AuthButton(
                    onTap: () {
                      context.read<AuthBloc>().add(
                        Sentemailotpevent(emailController.text),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationPage(),
                        ),
                      );
                    },
                    text: "Login",
                    icon: Icons.arrow_circle_right_rounded,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
