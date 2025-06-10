import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/auth/login/domain/entities/user_harura_entity.dart';
import 'package:car_keeper/app/features/auth/login/external/hasura_strings/hasura_strings.dart';
import 'package:car_keeper/app/features/auth/login/external/mappers/user_hasura_mapper.dart';
import 'package:car_keeper/app/features/auth/login/infra/datasource/i_get_user_datasource.dart';

class GetUserDatasource implements IGetUserDatasource {
  final IHasuraService _iHasuraService;

  GetUserDatasource({
    required IHasuraService iHasuraService,
  }) : _iHasuraService = iHasuraService;

  @override
  Future<UserHaruraEntity> call(String email) async {
    final response = await _iHasuraService
        .query(document: getUserHasuraStringQuery, variables: {'email': email});

    final responseData = response['data']['users'][0];

    return UserHasuraMapper.fromMap(responseData);
  }
}
