const String insertVehicleStringMutation =
    r'''mutation MyMutation($objects: [vehicles_insert_input!]!) {
  insert_vehicles(objects: $objects) {
    affected_rows
  }
}''';

const String getVehiclesQuery = r'''query MyQuery($idUser: Int!) {
  vehicles(where: {id_user: {_eq: $idUser}}) {
    created_at
    id
    id_user
    km
    make
    model
    plate
    vin
    year
  }
}
''';
