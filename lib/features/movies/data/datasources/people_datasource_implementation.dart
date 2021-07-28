import 'dart:convert';

import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/http_client/http_client.dart';
import 'package:loopi_challenge/core/utils/keys/tmdb_api_keys.dart';
import 'package:loopi_challenge/features/movies/data/datasources/people_datasource.dart';
import 'package:loopi_challenge/features/movies/data/models/people_model.dart';

import 'endpoints/tmdb_endpoints.dart';

class PeopleDatasourceImplementation implements IPeopleDatasource {
  final HttpClient httpClient;

  PeopleDatasourceImplementation(this.httpClient);

  @override
  Future<List<PeopleModel>> getMoviesCastByMovieId(int id) async {
    final response = await httpClient.get(
      TheMovieDBEndpoint.credits(id.toString(), TheMovieDBApiKeys.apiKey),
    );

    if (response.statusCode == 200) {
      try {
        List<PeopleModel> list = [];
        var responseJson = jsonDecode(response.data);

        for (var json in responseJson['cast']) {
          if (json['known_for_department'] == 'Acting') {
            list.add(PeopleModel.fromJson(json));
          }
        }
        for (var json in responseJson['crew']) {
          if (json['job'] == 'Director') {
            list.add(PeopleModel.fromJson(json));
          }
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
