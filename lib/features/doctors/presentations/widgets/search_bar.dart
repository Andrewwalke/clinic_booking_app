import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:flutter/material.dart';

class DoctorSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const DoctorSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.searchboxbackgroundcolor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search here...",
          hintStyle: TextStyle(color: CustomColors.searchboxhintstyle),
          suffixIcon: const Icon(
            Icons.search,
            color: CustomColors.dividercolor,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
