import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/features/movies/data/models/movie_model.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';

import '../../usefull/mocks.dart';

void main() {
  final tMovieModel = movieModelMock;

  setUp(() {});

  test("Should be a MovieEntity subclass", () {
    expect(tMovieModel, isA<MovieEntity>());
  });

  test("Should get a valid MovieModel from json", () {
    //Arrange
    final Map<String, dynamic> jsonMap = json.decode(movieMockFromJson);
    //Act
    final result = MovieModel.fromJson(jsonMap);
    //Assert
    expect(result, movieModelMock);
  });

  test("Should return a expected json map data", () {
    //Arrange
    final expectedMap = {
      "backdrop_path": "/g6R1OT7ETBLGLeUJOE0pOiAFHcI.jpg",
      "budget": 1200000,
      "genres": [
        {"id": 80, "name": "Criminal"},
        {"id": 53, "name": "Thriller"}
      ],
      "id": 500,
      "original_title": "Reservoir Dogs",
      "overview":
          "Uma gangue de ladrões, fugindo de um assalto bem-sucedido, encontra-se em um armazém. O problema é que a polícia está atrás deles, e cada um começa então a desconfiar que possa haver um traidor no grupo. O filme tem uma montagem que mostra as cenas no armazém intercalando-se com flashbacks da preparação para o crime, até um final surpreendente. Roteiro inteligente, na ótima estréia de Quentin Tarantino na direção.",
      "popularity": 24.708,
      "poster_path": "/84dzLDiFiACIqKtqQwzmB6GL7uC.jpg",
      "production_countries": [
        {"iso_3166_1": "US", "name": "United States of America"}
      ],
      "release_date": "1992-09-02",
      "revenue": 2859750,
      "runtime": 99,
      "status": "Released",
      "title": "Cães de Aluguel",
      "vote_average": 8.2,
      "vote_count": 10771
    };
    //Act
    final result = tMovieModel.toJson();
    //Assert
    expect(result, expectedMap);
  });
}
