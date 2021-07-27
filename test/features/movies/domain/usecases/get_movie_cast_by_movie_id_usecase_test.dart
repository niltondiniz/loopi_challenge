import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/people_repository.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_cast_by_movie_id_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockPeopleRepository extends Mock implements IPeopleRepository {}

void main() {
  late GetMovieCastByMovieId usecase;
  late IPeopleRepository repository;

  setUp(() {
    repository = MockPeopleRepository();
    usecase = GetMovieCastByMovieId(repository);
  });

  final tMovieCast = movieCastMock;
  final int param = 1;

  test("Should get a list of people from fiven movie", () async {
    //Arrange
    when(() => repository.getMovieCastByMovieId(param))
        .thenAnswer((_) async => Right(tMovieCast));
    //Act
    final result = await usecase(param);

    //Assert
    expect(result, Right(tMovieCast));
    verify(() => repository.getMovieCastByMovieId(param)).called(1);
  });

  test("Should get an error on get movie cast", () async {
    //Arrange
    when(() => repository.getMovieCastByMovieId(param))
        .thenAnswer((_) async => Left(ServerFailure()));
    //Act
    final result = await usecase(param);

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMovieCastByMovieId(param)).called(1);
  });
}
