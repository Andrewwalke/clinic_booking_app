// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:flutter/material.dart';

class NearbyDoctorTile extends StatefulWidget {
  final String name;
  final String rating;
  final String reviews;
  final String specialty;
  final String imageurl;
  const NearbyDoctorTile({
    super.key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.specialty,
    required this.imageurl,
  });

  @override
  State<NearbyDoctorTile> createState() => _NearbyDoctorTileState();
}

class _NearbyDoctorTileState extends State<NearbyDoctorTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CustomColors.searchboxbackgroundcolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(widget.imageurl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text("${widget.rating} (${widget.reviews} reviews)"),
                  ],
                ),
                Text(
                  widget.specialty,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
