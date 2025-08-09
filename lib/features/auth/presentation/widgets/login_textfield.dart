import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginTextfield extends StatefulWidget {
  final TextEditingController emailController;
  const LoginTextfield({super.key, required this.emailController});

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is missing";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'youremail@gmail.com',
        hintStyle: TextStyle(color: CustomColors.hinttexttextcolor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
