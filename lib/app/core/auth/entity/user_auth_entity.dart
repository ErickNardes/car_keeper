import 'package:firebase_auth/firebase_auth.dart';

class UserAuthEntity {
  final int id;
  final String email;
  final String name;
  final UserCredential userCredential;
  final DateTime cratedAt;
  final DateTime updatedAt;

  UserAuthEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.userCredential,
    required this.cratedAt,
    required this.updatedAt,
  });
}
