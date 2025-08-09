import 'package:clinic_doctor_interview/core/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clinic_doctor_interview/features/appointment/domain/entities/appointment.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_bloc.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_event.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/bloc/appointment_state.dart';
import 'package:lottie/lottie.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppointmentBloc>().add(LoadAppointments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.bookmark_outline),
                  Text(
                    "Appointments",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
              const SizedBox(height: 24),

              Expanded(
                child: BlocBuilder<AppointmentBloc, AppointmentState>(
                  builder: (context, state) {
                    if (state is Appointmentloadig ||
                        state is AppointmentInitial) {
                      return Center(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Lottie.network(
                            'https://lottie.host/744f2225-8d99-48ab-b6bb-ae5f48575015/dHyyTrCIaJ.lottie',
                          ),
                        ),
                      );
                    } else if (state is AppointmentLoaded) {
                      final appointments = state.appointments;
                      if (appointments.isEmpty) {
                        return const Center(
                          child: Text("No appointments found."),
                        );
                      }

                      final upcoming = appointments.toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (upcoming.isNotEmpty) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Upcoming",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "${upcoming.length}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  "See all",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: ListView.builder(
                                itemCount: upcoming.length,
                                itemBuilder: (context, index) {
                                  return _buildUpcomingCard(upcoming[index]);
                                },
                              ),
                            ),
                          ],
                        ],
                      );
                    } else if (state is AppointmentError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingCard(Appointment appointment) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: CustomColors.doctorboxgradientcolor1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appointment.date,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                appointment.time,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(appointment.imageUrl)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.doctorName,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    appointment.specialty,
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Pay now"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Call"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
