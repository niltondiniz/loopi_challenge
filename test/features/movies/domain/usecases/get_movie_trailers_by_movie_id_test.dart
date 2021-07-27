import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/trailer_repository.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_trailers_by_movie_id.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockTrailerRepository extends Mock implements ITrailerRepository {}

void main() {
  late ITrailerRepository repository;
  late GetMovieTrailersByMovieId usecase;

  setUp(() {
    repository = MockTrailerRepository();
    usecase = GetMovieTrailersByMovieId(repository);
  });

  final tListTrailer = listTrailerMock;
  int param = 1;

  test("Should get movie trailers for a given movie id", () async {
    //Arrange
    when(() => repository.getMovieTrailersByMovieId(param))
        .thenAnswer((invocation) async => Right(tListTrailer));
    //Act
    final result = await usecase(param);
    //Assert
    expect(result, Right(tListTrailer));
    verify(() => repository.getMovieTrailersByMovieId(param)).called(1);
  });

  test("Should get an server failure", () async {
    //Arrange
    when(() => repository.getMovieTrailersByMovieId(param))
        .thenAnswer((invocation) async => Left(ServerFailure()));
    //Act
    final result = await usecase(param);
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMovieTrailersByMovieId(param)).called(1);
  });
}
