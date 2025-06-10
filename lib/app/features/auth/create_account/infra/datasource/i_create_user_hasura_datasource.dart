import 'package:car_keeper/app/features/auth/create_account/domain/entities/create_user_hasura_entity.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/params/create_user_hasura_params.dart';

abstract class ICreateUserHasuraDatasource {
  Future<CreateUserHasuraEntity> call(CreateUserHasuraParams params);
}
