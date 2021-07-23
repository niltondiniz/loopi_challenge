import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/production_country_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/repositories/movie_repository.dart';
import 'package:loopi_challenge/features/Movies/domain/usecases/get_movie_from_id_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetMovieFromIdUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMovieFromIdUsecase(repository);
  });

  final int param = 500;
  final tMovie = movieMock;

  test("Should get a movie for a given id", () async {
    //Arrange
    when(() => repository.getMovieFromId(param))
        .thenAnswer((_) async => Right(tMovie));

    //Act
    final result = await usecase(param);

    //Assert
    expect(result, Right(tMovie));
    verify(() => repository.getMovieFromId(param)).called(1);
  });

  test("Should return a Failure on get a movie from id", () async {
    //Arrange
    when(() => repository.getMovieFromId(param))
        .thenAnswer((_) async => Left(ServerFailure()));

    //Act
    final result = await usecase(param);

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMovieFromId(param)).called(1);
  });
}
