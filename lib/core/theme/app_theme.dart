import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightheme = ThemeData.light().copyWith(
    chipTheme: ChipThemeData(
      backgroundColor: CustomColors.scaffoldbackgroundcolor,
      shape: RoundedRectangleBorder(
        side: BorderSide.none, // No border
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColors.scaffoldbackgroundcolor,
    ),
    scaffoldBackgroundColor: CustomColors.scaffoldbackgroundcolor,
  );
}
