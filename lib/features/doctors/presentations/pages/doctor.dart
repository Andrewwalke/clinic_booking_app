import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_bloc.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_event.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/confirm_appointment_dialog.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/time_selection_sheet.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/day_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailScreen extends StatefulWidget {
  final int id;
  final String name;
  final String specialty;
  final List<String> availableTimes;
  final List<String> availableDates;
  final String imageUrl;
  final double rating;
  final int hourlyPrice;
  final int reviewCount;
  final String hospitalName;
  final String description;

  const DoctorDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.specialty,
    required this.availableTimes,
    required this.availableDates,
    required this.imageUrl,
    required this.rating,
    required this.hourlyPrice,
    required this.reviewCount,
    required this.hospitalName,
    required this.description,
  });

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  String? selectedDate;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: screenWidth * 1.2, // responsive height
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: widget.imageUrl,
                      child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black87, Colors.transparent],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.black.withAlpha(90),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${widget.specialty} • ${widget.hospitalName}",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          "${widget.rating} (${widget.reviewCount} reviews)",
                          style: const TextStyle(
                            color: CustomColors.doctorboxgradientcolor2,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: CustomColors.dividercolor,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            widget.specialty,
                            style: TextStyle(color: CustomColors.textcolor1),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Make a Schedule",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 16),
                            SizedBox(width: 4),
                            Text("Select Date"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    if (widget.availableDates.isNotEmpty)
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.availableDates.length,
                          itemBuilder: (context, index) {
                            final entry = widget.availableDates[index];
                            final parts = entry.trim().split(RegExp(r'\s+'));
                            final day = parts.isNotEmpty ? parts[0] : '';
                            final date = parts.length > 1 ? parts[1] : '';
                            final isSelected = selectedDate == entry;

                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 16 : 8,
                                right: index == widget.availableDates.length - 1
                                    ? 16
                                    : 8,
                                top: 10,
                                bottom: 10,
                              ),
                              child: SizedBox(
                                width: (screenWidth - 64) / 4,
                                child: DayBox(
                                  day: day,
                                  date: date,
                                  isSelected: isSelected,
                                  isDark: false,
                                  onTap: () {
                                    setState(() {
                                      selectedDate = entry;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    else
                      const Text("No available dates"),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              flex: 0,
              child: Text(
                "\$${widget.hourlyPrice.toStringAsFixed(2)} p/h",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: selectedDate != null
                    ? () => _handleAppointment(context)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.buttonbackgroundcolor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Make Appointment",
                  style: GoogleFonts.poppins(
                    color: CustomColors.textcolor1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAppointment(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TimeSelectionSheet(
        availableTimes: widget.availableTimes,
        onTimeSelected: (time) {
          setState(() {
            selectedTime = time;
          });

          showDialog(
            context: context,
            builder: (_) => ConfirmAppointmentDialog(
              doctorName: widget.name,
              selectedDate: selectedDate!,
              selectedTime: selectedTime!,
              onConfirm: () {
                context.read<AppointmentBloc>().add(
                  AddAppointment(
                    Appointment(
                      id: widget.id,
                      doctorName: widget.name,
                      specialty: widget.hospitalName,
                      imageUrl: widget.imageUrl,
                      date: selectedDate!,
                      time: selectedTime!,
                      price: widget.hourlyPrice,
                      hospitalName: widget.hospitalName,
                    ),
                  ),
                );
              },
            ),
          );

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Appointment booked!")));
        },
      ),
    );
  }
}
