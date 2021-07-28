import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/data/datasources/genre_datasource.dart';
import 'package:loopi_challenge/features/movies/data/repositories/genre_repository_implementation.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockGenreDatasource extends Mock implements IGenreDatasource {}

void main() {
  late GenreRepositoryImplementation repository;
  late IGenreDatasource datasource;

  setUp(() {
    datasource = MockGenreDatasource();
    repository = GenreRepositoryImplementation(datasource);
  });

  final param = NoParams();
  final tListGenre = listGenreModelMock;

  test("Should return a Genre List on success", () async {
    //Arrange
    when(() => datasource.getMovieGenre(param))
        .thenAnswer((_) async => tListGenre);
    //Act
    final result = await repository.getMovieGenres(param);
    //Assert
    expect(result, Right(tListGenre));
    verify(() => datasource.getMovieGenre(param)).called(1);
  });

  test("Should return a ServerFailure on call datasource", () async {
    //Arrange
    when(() => datasource.getMovieGenre((param))).thenThrow(ServerException());
    //Act
    final result = await repository.getMovieGenres(param);
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getMovieGenre(param)).called(1);
  });
}
