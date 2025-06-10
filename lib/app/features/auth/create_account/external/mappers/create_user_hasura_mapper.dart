import 'package:car_keeper/app/features/auth/create_account/domain/entities/create_user_hasura_entity.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/params/create_user_hasura_params.dart';

class CreateUserHasuraMapper {
  static Map<String, dynamic> toMap(CreateUserHasuraParams params) {
    return <String, dynamic>{
      'objects': {
        'email': params.email,
        'name': params.name,
        'firebase_uid': params.firebaseUid,
      }
    };
  }

  static CreateUserHasuraEntity fromMap(Map<String, dynamic> map) {
    return CreateUserHasuraEntity(
      idUser: map['id'],
      email: map['email'],
      firebaseUid: map['firebase_uid'],
    );
  }
}
