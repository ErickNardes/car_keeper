abstract class IHasuraService {
  Future<Map<String, dynamic>> query({
    required String document,
    required Map<String, dynamic>? variables,
  });

  Future<Map<String, dynamic>> mutation({
    required String document,
    required Map<String, dynamic>? variables,
  });
}
