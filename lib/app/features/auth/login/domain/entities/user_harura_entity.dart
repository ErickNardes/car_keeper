class UserHaruraEntity {
  final int id;
  final String email;
  final String name;
  final String firebaseUid;
  final String? pushToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserHaruraEntity(
      {required this.id,
      required this.email,
      required this.name,
      required this.firebaseUid,
      required this.pushToken,
      required this.createdAt,
      required this.updatedAt});
}
