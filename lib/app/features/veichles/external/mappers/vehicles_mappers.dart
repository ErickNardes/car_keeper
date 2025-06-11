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
}
