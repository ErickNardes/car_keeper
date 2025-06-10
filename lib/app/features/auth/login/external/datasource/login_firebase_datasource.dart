import 'package:car_keeper/app/features/auth/login/infra/datasource/I_login_firebase_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFirebaseDatasource implements ILoginFirebaseDatasource {
  @override
  Future<UserCredential> call({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
