import 'package:flutter/material.dart';

typedef ConfirmCallback = void Function();

class ConfirmAppointmentDialog extends StatelessWidget {
  final String doctorName;
  final String selectedDate;
  final String selectedTime;
  final ConfirmCallback onConfirm;

  const ConfirmAppointmentDialog({
    super.key,
    required this.doctorName,
    required this.selectedDate,
    required this.selectedTime,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm Appointment"),
      content: Text(
        "Book appointment with $doctorName on $selectedDate at $selectedTime?",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
