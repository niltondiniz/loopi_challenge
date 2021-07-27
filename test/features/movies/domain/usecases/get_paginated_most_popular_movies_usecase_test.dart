import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/movie_repository.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_paginated_most_popular_movies_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetPaginatedMostPopularMoviesUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetPaginatedMostPopularMoviesUsecase(repository);
  });

  final tListmovies = listMovieMock;
  final int page = 1;

  test("Should get a paginated most popular movies list", () async {
    //Arrange
    when(() => repository.getPaginatedMostPopularmovies(page))
        .thenAnswer((_) async => Right(tListmovies));

    //Act
    final result = await usecase(page);

    //Assert
    expect(result, Right(tListmovies));
    verify(() => repository.getPaginatedMostPopularmovies(page)).called(1);
  });

  test("Should get an error on get most popular movies", () async {
    //Arrange
    when(() => repository.getPaginatedMostPopularmovies(page))
        .thenAnswer((invocation) async => Left(ServerFailure()));

    //Act
    final result = await usecase(page);

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getPaginatedMostPopularmovies(page)).called(1);
  });
}
