import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_paginated_most_popular_movies_usecase.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/home_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockGetMostPopularMoviesUsecase extends Mock
    implements GetPaginatedMostPopularMoviesUsecase {}

void main() {
  late HomeController controller;
  late GetPaginatedMostPopularMoviesUsecase usecase;

  setUp(() {
    usecase = MockGetMostPopularMoviesUsecase();
    controller = HomeController(usecase);
  });

  final tMovieEntity = listMovieMock;
  final int page = 1;

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
