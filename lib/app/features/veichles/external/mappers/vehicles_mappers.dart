import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';

class VehiclesMappers {
  static Map<String, dynamic> toMap(InsertVehicleParams params) {
    return {
      'objects': {
        'id_user': params.idUser,
        'make': params.make,
        'model': params.model,
        'year': params.year,
        'plate': params.plate,
        'vin': params.vin,
        'km': params.km,
      },
    };
  }

  static VehicleEntity fromMap(Map<String, dynamic> map) {
    return VehicleEntity(
        id: map['id'],
        idUser: map['id_user'],
        make: map['make'],
        model: map['model'],
        mileage: map['km'],
        vin: map['vin'],
        year: map['year'],
        createdAt: DateTime.parse(map['created_at']));
  }
}
