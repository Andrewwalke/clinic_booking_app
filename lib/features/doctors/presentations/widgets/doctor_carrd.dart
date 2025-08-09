import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/day_box.dart';
import 'package:flutter/material.dart';

class DoctorCarrd extends StatelessWidget {
  final String name;
  final String specialty;
  final List<String> availableTimes;
  final List<String> availableDates;
  final String imageUrl;
  final double rating;
  final int hourlyPrice;
  final int reviewCount;
  final String hospitalName;

  const DoctorCarrd({
    super.key,
    required this.name,
    required this.specialty,
    required this.availableTimes,
    required this.availableDates,
    required this.imageUrl,
    required this.rating,
    required this.hourlyPrice,
    required this.reviewCount,
    required this.hospitalName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.doctorboxgradientcolor1,
            CustomColors.doctorboxgradientcolor2,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 35, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 16),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("$specialty • \$$hourlyPrice/Session"),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text("$rating ($reviewCount)"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Available dates horizontal scroll
          if (availableDates.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(40),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white30),
              ),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: availableDates.map((entry) {
                  final parts = entry.split(' ');
                  final day = parts[0];
                  final date = parts[1];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DayBox(day: day, date: date),
                  );
                }).toList(),
              ),
            )
          else
            const Text(
              "No available dates",
              style: TextStyle(color: Colors.white),
            ),

          const SizedBox(height: 1),
        ],
      ),
    );
  }
}
