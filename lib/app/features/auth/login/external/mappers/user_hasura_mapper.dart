import 'package:car_keeper/app/features/auth/login/domain/entities/user_harura_entity.dart';

class UserHasuraMapper {
  static UserHaruraEntity fromMap(Map<String, dynamic> map) {
    return UserHaruraEntity(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      firebaseUid: map['firebase_uid'],
      pushToken: map['push_token'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }
}
