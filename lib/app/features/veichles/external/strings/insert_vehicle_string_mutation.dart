const String insertVehicleStringMutation =
    r'''mutation MyMutation($objects: [vehicles_insert_input!]!) {
  insert_vehicles(objects: $objects) {
    affected_rows
  }
}''';
