import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_cast_by_movie_id_usecase.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_from_id_usecase.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/detail_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockGetMovieCastByMovieId extends Mock implements GetMovieCastByMovieId {}

class MockGetMovieFromId extends Mock implements GetMovieFromIdUsecase {}

void main() {
  late GetMovieCastByMovieId peopleUsecase;
  late GetMovieFromIdUsecase movieUsecase;
  late DetailController controller;

  setUp(() {
    peopleUsecase = MockGetMovieCastByMovieId();
    movieUsecase = MockGetMovieFromId();
    controller = DetailController(movieUsecase, peopleUsecase);
  });

  final int param = 1;
  final tMovieEntity = movieMock;
  final tMovieCast = movieCastMock;

  test("Should return a MovieEntity", () async {
    //Arrange
    when(() => peopleUsecase(param))
        .thenAnswer((invocation) async => Right(tMovieCast));
    when(() => movieUsecase(param))
        .thenAnswer((invocation) async => Right(tMovieEntity));
    //Act
    final result = await controller.getMovieFromId(param);
    //Assert
    controller.observer(onState: (state) {
      expect(result, tMovieEntity);
      verify(() => movieUsecase(param)).called(1);
      verify(() => peopleUsecase(param)).called(1);
    });
  });
}
