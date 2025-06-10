import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/entities/create_user_hasura_entity.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/params/create_user_hasura_params.dart';
import 'package:car_keeper/app/features/auth/create_account/external/mappers/create_user_hasura_mapper.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/datasource/i_create_user_hasura_datasource.dart';
import 'package:car_keeper/app/features/auth/create_account/strings/hasura_strings.dart';

class CreateUserHasuraDatasource implements ICreateUserHasuraDatasource {
  final IHasuraService _iHasuraService;

  CreateUserHasuraDatasource({required IHasuraService iHasuraService})
      : _iHasuraService = iHasuraService;

  @override
  Future<CreateUserHasuraEntity> call(CreateUserHasuraParams params) async {
    final response = await _iHasuraService.mutation(
      document: createUserHasuraMutationString,
      variables: CreateUserHasuraMapper.toMap(params),
    );

    final responseData = CreateUserHasuraMapper.fromMap(
        response['data']['insert_users']['returning'][0]);
    return responseData;
  }
}
