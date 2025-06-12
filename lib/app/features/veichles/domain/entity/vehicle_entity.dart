class VehicleEntity {
  final int id;
  final int idUser;
  final double? mileage;
  final String make;
  final String model;
  final String? plate;
  final String? vin;
  final double? year;
  final DateTime createdAt;
  VehicleEntity({
    required this.id,
    required this.idUser,
    this.mileage,
    required this.make,
    required this.model,
    this.plate,
    this.vin,
    this.year,
    required this.createdAt,
  });
}
