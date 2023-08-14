import 'package:dio/dio.dart';

const baseUrl = 'https://api.thenewsapi.com/v1';

class ApiServiceImpl {
  final Dio dio = Dio();

  Future<Response<dynamic>> getTopNews({
    required String token,
    String locale = 'us',
    int limit = 100,
  }) async =>
      await dio.get('$baseUrl/news/top', queryParameters: {
        'api_token': token,
        'locale': locale,
        'limit': limit,
      });
}
