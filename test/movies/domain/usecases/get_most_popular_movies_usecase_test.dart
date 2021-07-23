import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/production_country_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/repositories/movie_repository.dart';
import 'package:loopi_challenge/features/Movies/domain/usecases/get_most_popular_movies_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetMostPopularMoviesUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMostPopularMoviesUsecase(repository);
  });

  final tListMovies = listMovieMock;

  test("Should get a most popular movies list", () async {
    //Arrange
    when(() => repository.getMostPopularMovies(NoParams()))
        .thenAnswer((_) async => Right(tListMovies));

    //Act
    final result = await usecase(NoParams());

    //Assert
    expect(result, Right(tListMovies));
    verify(() => repository.getMostPopularMovies(NoParams())).called(1);
  });

  test("Should get an error on get most popular movies", () async {
    //Arrange
    when(() => repository.getMostPopularMovies(NoParams()))
        .thenAnswer((invocation) async => Left(ServerFailure()));

    //Act
    final result = await usecase(NoParams());

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMostPopularMovies(NoParams())).called(1);
  });
}
