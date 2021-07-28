import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/data/datasources/people_datasource.dart';
import 'package:loopi_challenge/features/movies/data/datasources/people_datasource_implementation.dart';
import 'package:loopi_challenge/features/movies/data/repositories/people_repository_implementation.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockPeopleDatasource extends Mock implements IPeopleDatasource {}

void main() {
  late PeopleRepositoryImplementation repository;
  late IPeopleDatasource datasource;

  setUp(() {
    datasource = MockPeopleDatasource();
    repository = PeopleRepositoryImplementation(datasource);
  });

  final tPeopleList = movieCastModelMock;
  int param = 1;

  test("Should return a PeopleModel list from mock datasource", () async {
    //Arrange
    when(() => datasource.getMoviesCastByMovieId(param))
        .thenAnswer((_) async => tPeopleList);
    //Act
    final result = await repository.getMovieCastByMovieId(param);
    //Assert
    expect(result, Right(tPeopleList));
    verify(() => datasource.getMoviesCastByMovieId(param)).called(1);
  });

  test("Should return a ServerFailure on call datasource", () async {
    //Arrange
    when(() => datasource.getMoviesCastByMovieId(param))
        .thenThrow(ServerException());
    //Act
    final result = await repository.getMovieCastByMovieId(param);
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getMoviesCastByMovieId(param)).called(1);
  });
}
