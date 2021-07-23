import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/repositories/movie_repository.dart';
import 'package:loopi_challenge/features/Movies/domain/usecases/get_movies_from_chosen_genres_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetMoviesFromChosenGenresUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMoviesFromChosenGenresUsecase(repository);
  });

  final params = [GenreEntity(id: 1, name: "Action")];
  final tListMovies = listMovieMock;

  test("Should get a list of filtered movies", () async {
    //Arrange
    when(() => repository.getMoviesFromChosenGenres(params))
        .thenAnswer((invocation) async => Right(tListMovies));
    //Act
    final result = await usecase(params);
    //Assert
    expect(result, Right(tListMovies));
  });

  test("Should get an error", () async {
    //Arrange
    when(() => repository.getMoviesFromChosenGenres(params))
        .thenAnswer((invocation) async => Left(ServerFailure()));
    //Act
    final result = await usecase(params);
    //Assert
    expect(result, Left(ServerFailure()));
  });
}
