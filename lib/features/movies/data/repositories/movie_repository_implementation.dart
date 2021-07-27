import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/core/types/list_genres_list_movie_type.dart';
import 'package:loopi_challenge/features/movies/data/datasources/movie_datasource.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImplementation implements IMovieRepository {
  final IMovieDatasource datasource;

  MovieRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPaginatedMostPopularmovies(
      int page) async {
    try {
      final result = await datasource.getPaginatedMostPopularMovies(page);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieEntity>> getMovieFromId(int id) async {
    try {
      final result = await datasource.getMovieFromId(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesFromChosenGenres(
      ListGenresListMovies param) async {
    try {
      final result = param.genres
          .map((genre) => param.moviesToFilter
              .where((movie) => (movie.genreIds as List).contains(genre))
              .toList())
          .expand((result) => result)
          .toList();

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
