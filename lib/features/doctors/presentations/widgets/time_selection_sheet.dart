import 'package:flutter/material.dart';

typedef TimeSelectedCallback = void Function(String selectedTime);

class TimeSelectionSheet extends StatelessWidget {
  final List<String> availableTimes;
  final TimeSelectedCallback onTimeSelected;

  const TimeSelectionSheet({
    super.key,
    required this.availableTimes,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: availableTimes.map((time) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.lock_clock_outlined),
              title: Text(time),
              onTap: () {
                Navigator.pop(context); // Close the sheet
                onTimeSelected(time); // Callback to parent
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
