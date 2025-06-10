import 'dart:convert';

import 'package:car_keeper/app/core/failure/app_failure.dart';
import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:http/http.dart' as http;

class HasuraService implements IHasuraService {
  @override
  Future<Map<String, dynamic>> mutation({
    required String document,
    required Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://car-keeper.hasura.app/v1/graphql'),
        headers: {
          'x-hasura-admin-secret':
              'h3tuAknCYp4mbwEhTI9kPAuq95CnLjaxFTBRk7HuF53XH7mNB4oeFZU2I37pDQNU',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'query': document,
          'variables': variables,
        }),
      );
      final data = json.decode(response.body);
      return data;
    } catch (e) {
      throw AppFailure(message: 'Erro Hasura mutation: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> query({
    required String document,
    required Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://car-keeper.hasura.app/v1/graphql'),
        headers: {
          'x-hasura-admin-secret':
              'h3tuAknCYp4mbwEhTI9kPAuq95CnLjaxFTBRk7HuF53XH7mNB4oeFZU2I37pDQNU',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'query': document,
          'variables': variables,
        }),
      );
      final data = json.decode(response.body);
      return data;
    } catch (e) {
      throw AppFailure(message: 'Erro Hasura query: $e');
    }
  }
}
