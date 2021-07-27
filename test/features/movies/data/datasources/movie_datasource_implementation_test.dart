import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/http_client/http_client.dart';
import 'package:loopi_challenge/core/utils/keys/tmdb_api_keys.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/data/datasources/movie_datasource.dart';
import 'package:loopi_challenge/features/movies/data/datasources/movie_datasource_implementation.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late IMovieDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    datasource = MovieDatasourceImplementation(client);
  });

  final param = 500;
  final apiKey = "f54e8290a68bc80dbcf2bdb116162051";
  final tMovieModel = movieModelMock;

  test("Should return a movie on success", () async {
    //Arrange
    when(() => client
            .get(TheMovieDBEndpoint.movie("500", TheMovieDBApiKeys.apiKey)))
        .thenAnswer((_) async =>
            HttpResponse(data: movieMockFromJson, statusCode: 200));
    //Act
    final result = await datasource.getMovieFromId(param);
    //Assert
    expect(result, tMovieModel);
    verify(() => client.get(TheMovieDBEndpoint.movie("500", apiKey))).called(1);
  });

  test("Should throw a exception", () async {
    //Arrange
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: "page not found", statusCode: 400));
    //Act
    final result = datasource.getMovieFromId(param);
    //Assert
    expect(result, throwsA(ServerException()));
  });
}
