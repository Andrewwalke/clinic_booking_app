class DoctorModel {
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
  DoctorModel({
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
}
