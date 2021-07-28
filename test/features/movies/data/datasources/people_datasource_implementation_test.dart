import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/http_client/http_client.dart';
import 'package:loopi_challenge/core/utils/keys/tmdb_api_keys.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/data/datasources/people_datasource.dart';
import 'package:loopi_challenge/features/movies/data/datasources/people_datasource_implementation.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late IPeopleDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    datasource = PeopleDatasourceImplementation(client);
  });

  final tMovieCastMockFromJson = movieCastMockFromJson;
  final param = 500;

  test("Should return a list of people on success", () async {
    //Arrange
    when(() => client
            .get(TheMovieDBEndpoint.credits("500", TheMovieDBApiKeys.apiKey)))
        .thenAnswer((invocation) async => HttpResponse(
              data: tMovieCastMockFromJson,
              statusCode: 200,
            ));
    //Act
    await datasource.getMoviesCastByMovieId(param);
    //Assert
    verify(() => client.get(TheMovieDBEndpoint.credits(
        param.toString(), TheMovieDBApiKeys.apiKey))).called(1);
  });

  test("Should throw a server exception", () async {
    //Arrange
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
          data: "page not found",
          statusCode: 400,
        ));
    //Act
    final result = datasource.getMoviesCastByMovieId(param);
    //Assert
    expect(result, throwsA(ServerException()));
  });
}
