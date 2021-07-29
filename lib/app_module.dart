import 'package:flutter_modular/flutter_modular.dart';
import 'package:loopi_challenge/core/http_client/http_implementation.dart';
import 'package:loopi_challenge/features/movies/data/datasources/movie_datasource_implementation.dart';
import 'package:loopi_challenge/features/movies/data/datasources/people_datasource_implementation.dart';
import 'package:loopi_challenge/features/movies/data/repositories/movie_repository_implementation.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_cast_by_movie_id_usecase.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_from_id_usecase.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_genres.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movies_from_chosen_genres_usecase.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_paginated_most_popular_movies_usecase.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/home_controller.dart';

import 'features/movies/data/datasources/genre_datasource_implementation.dart';
import 'features/movies/data/repositories/genre_repository_implementation.dart';
import 'features/movies/data/repositories/people_repository_implementation.dart';
import 'features/movies/presenter/controllers/detail_controller.dart';
import 'features/movies/presenter/controllers/filter_controller.dart';
import 'features/movies/presenter/pages/detail_page.dart';
import 'features/movies/presenter/pages/home_page.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => http.Client()),
    Bind((i) => HomeController(i(), i())),
    Bind((i) => DetailController(i(), i())),
    Bind((i) => FilterController(i())),
    Bind((i) => GetPaginatedMostPopularMoviesUsecase(i())),
    Bind((i) => GetmoviesFromChosenGenresUsecase(i())),
    Bind((i) => GetMovieFromIdUsecase(i())),
    Bind((i) => GetMovieGenres(i())),
    Bind((i) => GetMovieCastByMovieId(i())),
    Bind((i) => MovieRepositoryImplementation(i())),
    Bind((i) => PeopleRepositoryImplementation(i())),
    Bind((i) => GenreRepositoryImplementation(i())),
    Bind((i) => HttpImplementation(i())),
    Bind((i) => MovieDatasourceImplementation(i())),
    Bind((i) => PeopleDatasourceImplementation(i())),
    Bind((i) => GenreDatasourceImplementation(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute(
      '/detail',
      child: (_, args) => DetailPage(
        movie: args.data,
      ),
    ),
  ];
}
