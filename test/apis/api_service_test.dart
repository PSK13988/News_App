import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:styli/apis/api_service.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late ApiServiceImpl apiServiceImpl;

  setUp(() {
    dio = MockDio();
    apiServiceImpl = ApiServiceImpl(dio);
  });

  test(
      'should call [ApiServiceImpl.getTopNews] and return [Future<Response<dynamic>> ]',
      () async {
    // Arrange
    when(() => dio.get(any())).thenAnswer((_) async =>
        Response<dynamic>(requestOptions: RequestOptions(), statusCode: 200));

    // Act
    final response = await apiServiceImpl.getTopNews(token: 'token');
    // Assert
    expect(response, isA<Response<dynamic>>());
    expect(response.statusCode, 200);

    verify(() => dio.get(any())).called(1);
    verifyNoMoreInteractions(dio);
  });
}
