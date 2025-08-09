import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/pages/appointments.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEE, dd MMM yyyy').format(now);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formattedDate, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            const Text(
              "Hello 👋",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppointmentScreen()),
            );
          },
          child: CircleAvatar(
            radius: 24,
            backgroundColor: CustomColors.dividercolor,

            child: Icon(Icons.card_travel, color: CustomColors.activedotcolor),
          ),
        ),
      ],
    );
  }
}
