import 'package:car_keeper/app/features/auth/create_account/infra/datasource/i_create_user_firebase_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserFirebaseDatasource implements ICreateUserFirebaseDatasource {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> call({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
