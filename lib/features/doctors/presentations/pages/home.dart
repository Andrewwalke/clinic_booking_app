import 'package:flutter/material.dart';
import 'package:clinic_doctor_interview/core/constants/doctors_datas.dart';
import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/pages/doctor.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/doctor_carrd.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/nearby_doctor.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/search_bar.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/widgets/topbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List filteredDoctors = doctorsList;

  void _filterDoctors(String query) {
    final filtered = doctorsList.where((doctor) {
      final nameLower = doctor.name.toLowerCase();
      final specialtyLower = doctor.specialty.toLowerCase();
      final input = query.toLowerCase();

      return nameLower.contains(input) || specialtyLower.contains(input);
    }).toList();

    setState(() {
      filteredDoctors = filtered;
    });
  }

  Widget _noDoctorsWidget(String message) {
    return SizedBox(
      height: 270,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning_amber_rounded, size: 60, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              message,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _noDoctorsNearYouWidget(String message) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.local_hospital_outlined, size: 60, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              message,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Topbar(),
              const SizedBox(height: 20),
              DoctorSearchBar(onChanged: _filterDoctors),
              const SizedBox(height: 20),
              Text(
                'Top Doctors',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: CustomColors.textcolor1,
                ),
              ),
              const SizedBox(height: 10),
              filteredDoctors.isEmpty
                  ? _noDoctorsWidget("No doctors available")
                  : SizedBox(
                      height: 270,
                      child: ListView.builder(
                        itemCount: filteredDoctors.length > 10
                            ? 10
                            : filteredDoctors.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final doctor = filteredDoctors[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorDetailScreen(
                                  id: doctor.id,
                                  name: doctor.name,
                                  specialty: doctor.specialty,
                                  imageUrl: doctor.imageUrl,
                                  rating: doctor.rating,
                                  hourlyPrice: doctor.hourlyPrice,
                                  reviewCount: doctor.reviewCount,
                                  hospitalName: doctor.hospitalName,
                                  availableDates: doctor.availableDates,
                                  availableTimes: doctor.availableTimes,
                                  description: doctor.description,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: SizedBox(
                                width: 300,
                                child: DoctorCarrd(
                                  name: doctor.name,
                                  specialty: doctor.specialty,
                                  imageUrl: doctor.imageUrl,
                                  rating: doctor.rating,
                                  hourlyPrice: doctor.hourlyPrice,
                                  reviewCount: doctor.reviewCount,
                                  hospitalName: doctor.hospitalName,
                                  availableDates: doctor.availableDates,
                                  availableTimes: doctor.availableTimes,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              const SizedBox(height: 20),
              Text(
                'Doctors Near You (${filteredDoctors.length})',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: CustomColors.textcolor1,
                ),
              ),
              const SizedBox(height: 10),
              filteredDoctors.isEmpty
                  ? _noDoctorsNearYouWidget("No doctors near you")
                  : SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: filteredDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = filteredDoctors[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorDetailScreen(
                                  id: doctor.id,
                                  name: doctor.name,
                                  specialty: doctor.specialty,
                                  imageUrl: doctor.imageUrl,
                                  rating: doctor.rating,
                                  hourlyPrice: doctor.hourlyPrice,
                                  reviewCount: doctor.reviewCount,
                                  hospitalName: doctor.hospitalName,
                                  availableDates: doctor.availableDates,
                                  availableTimes: doctor.availableTimes,
                                  description: doctor.description,
                                ),
                              ),
                            ),
                            child: NearbyDoctorTile(
                              name: doctor.name,
                              rating: doctor.rating.toString(),
                              reviews: doctor.reviewCount.toString(),
                              specialty:
                                  '${doctor.specialty} - ${doctor.hospitalName}',
                              imageurl: doctor.imageUrl,
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
