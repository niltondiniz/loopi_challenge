import 'package:flutter_modular/flutter_modular.dart';
import 'package:loopi_challenge/core/http_client/http_client.dart';
import 'package:loopi_challenge/core/http_client/http_implementation.dart';
import 'package:loopi_challenge/features/movies/data/datasources/movie_datasource_implementation.dart';
import 'package:loopi_challenge/features/movies/data/repositories/movie_repository_implementation.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_paginated_most_popular_movies_usecase.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/home_controller.dart';

import 'features/movies/presenter/pages/detail_page.dart';
import 'features/movies/presenter/pages/home_page.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => http.Client()),
    Bind((i) => HomeController(i())),
    Bind((i) => GetPaginatedMostPopularMoviesUsecase(i())),
    Bind((i) => MovieRepositoryImplementation(i())),
    Bind((i) => HttpImplementation(i())),
    Bind((i) => MovieDatasourceImplementation(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/detail', child: (_, __) => DetailPage()),
  ];
}