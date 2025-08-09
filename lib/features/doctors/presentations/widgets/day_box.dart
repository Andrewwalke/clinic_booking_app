import 'dart:ui';
import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:flutter/material.dart';

class DayBox extends StatelessWidget {
  final String day;
  final String date;
  final bool isDark;
  final VoidCallback? onTap;
  final bool isSelected;

  const DayBox({
    super.key,
    required this.day,
    required this.date,
    this.isDark = true,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? CustomColors.styledtextcolor1.withAlpha(80)
        : isDark
        ? Colors.white.withAlpha(20)
        : Colors.black.withAlpha(10);

    final borderColor = isSelected
        ? CustomColors.styledtextcolor1.withAlpha(80)
        : isDark
        ? Colors.white30
        : Colors.black12;

    final textColor = isSelected
        ? Colors.white
        : isDark
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: 60,
            height: 50,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
