import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/genre_repository.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_genres.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockGenreRepository extends Mock implements IGenreRepository {}

void main() {
  late GetMovieGenres usecase;
  late IGenreRepository repository;

  setUp(() {
    repository = MockGenreRepository();
    usecase = GetMovieGenres(repository);
  });

  final tListGenre = listGenreMock;

  test("Should get movie genres", () async {
    //Arrange
    when(() => repository.getMovieGenres(NoParams()))
        .thenAnswer((invocation) async => Right(tListGenre));
    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Right(tListGenre));
    verify(() => repository.getMovieGenres(NoParams())).called(1);
  });

  test("Should get server failure", () async {
    //Arrange
    when(() => repository.getMovieGenres(NoParams()))
        .thenAnswer((invocation) async => Left(ServerFailure()));
    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMovieGenres(NoParams())).called(1);
  });
}
