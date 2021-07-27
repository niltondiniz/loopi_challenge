import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/types/list_genres_list_movie_type.dart';
import 'package:loopi_challenge/features/movies/data/datasources/movie_datasource.dart';
import 'package:loopi_challenge/features/movies/data/models/movie_model.dart';
import 'package:loopi_challenge/features/movies/data/repositories/movie_repository_implementation.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:mocktail/mocktail.dart';

import '../../usefull/mocks.dart';

class MockMovieDatasource extends Mock implements IMovieDatasource {}

void main() {
  late MovieRepositoryImplementation repository;
  late IMovieDatasource datasource;

  setUp(() {
    datasource = MockMovieDatasource();
    repository = MovieRepositoryImplementation(datasource);
  });

  int page = 1;
  List<int> genres = [80, 53];

  final tMovieModel = movieModelMock;
  final tListMovieModel = listMovieModelMock;
  final tListMovieEntity = listMovieMock;

  test("Should return a movie model when calls the datasource", () async {
    //Arrange
    when(() => datasource.getMovieFromId(page))
        .thenAnswer((_) async => tMovieModel);
    //Act
    final result = await repository.getMovieFromId(page);
    //Assert
    expect(result, Right<Failure, MovieModel>(tMovieModel));
    verify(() => datasource.getMovieFromId(page)).called(1);
  });

  test("Should return an failure when the call to datasource is unsucessfull",
      () async {
    //Arrange
    when(() => datasource.getMovieFromId(page)).thenThrow(ServerException());
    //Act
    final result = await repository.getMovieFromId(page);
    //Assert
    expect(result, Left<Failure, MovieModel>(ServerFailure()));
    verify(() => datasource.getMovieFromId(page)).called(1);
  });

  test("Should return paginated most popular movies", () async {
    //Arrange
    when(() => datasource.getPaginatedMostPopularMovies(page))
        .thenAnswer((_) async => tListMovieModel);
    //Act
    final result = await repository.getPaginatedMostPopularmovies(page);
    //Assert
    expect(result, Right<Failure, List<MovieModel>>(tListMovieModel));
    verify(() => datasource.getPaginatedMostPopularMovies(page)).called(1);
  });

  test("Should return an failure when the call to datasource is unsucessfull",
      () async {
    //Arrange
    when(() => datasource.getMovieFromId(page)).thenThrow(ServerException());
    //Act
    final result = await repository.getMovieFromId(page);
    //Assert
    expect(result, Left<Failure, MovieModel>(ServerFailure()));
    verify(() => datasource.getMovieFromId(page)).called(1);
  });

  test("Should return two filtered movies", () async {
    //Arrange
    //
    //Act
    final result = await repository.getMoviesFromChosenGenres(
      ListGenresListMovies(genres: genres, moviesToFilter: tListMovieEntity),
    );
    print(Right(result).length());
    //Assert
    List<MovieEntity> lista = [];
    result.fold((error) => () {}, (success) {
      lista = success;
    });
    expect(lista, tListMovieEntity);
  });
}
