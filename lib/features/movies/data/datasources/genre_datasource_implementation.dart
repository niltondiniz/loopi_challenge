import 'dart:convert';

import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/http_client/http_client.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/core/utils/keys/tmdb_api_keys.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/data/datasources/genre_datasource.dart';
import 'package:loopi_challenge/features/movies/data/models/genre_model.dart';

class GenreDatasourceImplementation implements IGenreDatasource {
  final HttpClient httpClient;

  GenreDatasourceImplementation(this.httpClient);

  @override
  Future<List<GenreModel>> getMovieGenre(NoParams noParams) async {
    final response = await httpClient
        .get(TheMovieDBEndpoint.genres(TheMovieDBApiKeys.apiKey));

    if (response.statusCode == 200) {
      try {
        var jsonResult = jsonDecode(response.data);

        return List<GenreModel>.from(
            jsonResult['genres'].map((e) => GenreModel.fromJson(e)));
      } catch (e) {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}
