import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/types/list_genres_list_movie_type.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movies_from_chosen_genres_usecase.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_paginated_most_popular_movies_usecase.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/home_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockGetMostPopularMoviesUsecase extends Mock
    implements GetPaginatedMostPopularMoviesUsecase {}

class MockGetmoviesFromChosenGenresUsecase extends Mock
    implements GetmoviesFromChosenGenresUsecase {}

void main() {
  late HomeController controller;
  late GetPaginatedMostPopularMoviesUsecase usecase;
  late GetmoviesFromChosenGenresUsecase filterUsecase;

  setUp(() {
    usecase = MockGetMostPopularMoviesUsecase();
    filterUsecase = MockGetmoviesFromChosenGenresUsecase();
    controller = HomeController(usecase, filterUsecase);
  });

  final tMovieEntity = listMovieMock;
  final int page = 1;
  final ListGenresListMovies filterParam = ListGenresListMovies(
    genres: [],
    moviesToFilter: listMovieMock,
  );

  test("Should return a MovieEntity", () async {
    //Arrange
    when(() => usecase(page))
        .thenAnswer((invocation) async => Right(tMovieEntity));
    //Act
    await controller.getPaginatedMostPopularMovies(page);

    //Assert
    controller.observer(onState: (state) {
      expect(state, tMovieEntity);
      verify(() => usecase(page)).called(1);
      verify(() => filterUsecase(filterParam)).called(1);
    });
  });

  test("Should return a failure", () async {
    //Arrange
    when(() => usecase(page))
        .thenAnswer((invocation) async => Left(ServerFailure()));
    //Act
    await controller.getPaginatedMostPopularMovies(page);

    //Assert
    controller.observer(
      onError: (error) {
        expect(error, Left(ServerFailure()));
        verify(() => usecase(page)).called(1);
      },
    );
  });
}
