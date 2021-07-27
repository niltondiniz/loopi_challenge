import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/types/list_genres_list_movie_type.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/movie_repository.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movies_from_chosen_genres_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetmoviesFromChosenGenresUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetmoviesFromChosenGenresUsecase(repository);
  });

  final genres = [53];
  final tListmovies = listMovieMock;
  final ListGenresListMovies param = ListGenresListMovies(
    genres: genres,
    moviesToFilter: tListmovies,
  );

  test("Should get a list of filtered movies", () async {
    //Arrange
    when(() => repository.getMoviesFromChosenGenres(param))
        .thenAnswer((invocation) async => Right(tListmovies));
    //Act
    final result = await usecase(param);
    //Assert
    expect(result.length(), Right(tListmovies).length());
    verify(() => repository.getMoviesFromChosenGenres(param)).called(1);
  });

  test("Should get an error", () async {
    //Arrange
    when(() => repository.getMoviesFromChosenGenres(param))
        .thenAnswer((invocation) async => Left(ServerFailure()));
    //Act
    final result = await usecase(param);
    //Assert
    expect(result, Left(ServerFailure()));
  });
}
