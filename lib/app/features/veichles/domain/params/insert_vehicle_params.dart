class InsertVehicleParams {
  final int? idUser;
  final String? make;
  final String? model;
  final int? year;
  final String? plate;
  final String? vin;
  final int? km;
  InsertVehicleParams({
    this.idUser,
    this.make,
    this.model,
    this.year,
    this.plate,
    this.vin,
    this.km,
  });

  InsertVehicleParams copyWith({
    int? idUser,
    String? make,
    String? model,
    int? year,
    String? plate,
    String? vin,
    int? km,
  }) {
    return InsertVehicleParams(
      idUser: idUser ?? this.idUser,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      plate: plate ?? this.plate,
      vin: vin ?? this.vin,
      km: km ?? this.km,
    );
  }
}
