import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/http_client/http_client.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/core/utils/keys/tmdb_api_keys.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/data/datasources/genre_datasource.dart';
import 'package:loopi_challenge/features/movies/data/datasources/genre_datasource_implementation.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late HttpClient client;
  late IGenreDatasource datasource;

  setUp(() {
    client = MockHttpClient();
    datasource = GenreDatasourceImplementation(client);
  });

  final tGenreListFromJson = genreListMockFromJson;
  final param = NoParams();

  test("Should return a genre list on success", () async {
    //Arrange
    when(() => client.get(TheMovieDBEndpoint.genres(TheMovieDBApiKeys.apiKey)))
        .thenAnswer((_) async =>
            HttpResponse(data: tGenreListFromJson, statusCode: 200));
    //Act
    await datasource.getMovieGenre(param);
    //Assert
    verify(() =>
            client.get(TheMovieDBEndpoint.genres(TheMovieDBApiKeys.apiKey)))
        .called(1);
  });

  test("Should return a server exception", () async {
    //Arrange
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: "page not found", statusCode: 400));
    //Act
    final result = datasource.getMovieGenre(param);
    //Assert
    expect(result, throwsA(ServerException()));
    verify(() =>
            client.get(TheMovieDBEndpoint.genres(TheMovieDBApiKeys.apiKey)))
        .called(1);
  });
}
