import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData? icon;
  const AuthButton({
    super.key,
    required this.onTap,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          color: CustomColors.buttonbackgroundcolor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: CustomColors.textcolor1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Icon(icon ?? Icons.medical_services),
          ],
        ),
      ),
    );
  }
}
