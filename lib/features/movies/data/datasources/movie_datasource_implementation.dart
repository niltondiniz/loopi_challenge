import 'dart:convert';

import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/http_client/http_client.dart';
import 'package:loopi_challenge/core/utils/keys/tmdb_api_keys.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/data/models/movie_model.dart';

import 'movie_datasource.dart';

class MovieDatasourceImplementation implements IMovieDatasource {
  final HttpClient httpClient;

  MovieDatasourceImplementation(this.httpClient);

  @override
  Future<MovieModel> getMovieFromId(int id) async {
    final response = await httpClient.get(
      TheMovieDBEndpoint.movie(id.toString(), TheMovieDBApiKeys.apiKey),
    );

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPaginatedMostPopularMovies(int page) async {
    final response = await httpClient.get(
      TheMovieDBEndpoint.paginatedMostPopularMovies(
        TheMovieDBApiKeys.apiKey,
        page.toString(),
      ),
    );

    if (response.statusCode == 200) {
      try {
        List<MovieModel> list = [];
        var responseJson = jsonDecode(response.data);

        for (var json in responseJson['results']) {
          list.add(MovieModel.fromJson(json));
        }
        return list;
      } catch (e) {
        print(e);
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}
