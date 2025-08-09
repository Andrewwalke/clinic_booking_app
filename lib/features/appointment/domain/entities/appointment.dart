class Appointment {
  final int id;
  final String doctorName;
  final String specialty;
  final String imageUrl;
  final String date;
  final String time;
  final int price;
  final String hospitalName;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.imageUrl,
    required this.date,
    required this.time,
    required this.price,
    required this.hospitalName,
  });
}
