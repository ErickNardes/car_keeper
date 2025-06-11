class InsertVehicleParams {
  final int idUser;
  final String make;
  final String model;
  final int? year;
  final String? plate;
  final String? vin;
  final int? km;
  InsertVehicleParams({
    required this.idUser,
    required this.make,
    required this.model,
    this.year,
    this.plate,
    this.vin,
    this.km,
  });
}
