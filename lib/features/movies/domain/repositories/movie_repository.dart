import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/types/list_genres_list_movie_type.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';

abstract class IMovieRepository {
  Future<Either<Failure, MovieEntity>> getMovieFromId(int id);
  Future<Either<Failure, List<MovieEntity>>> getPaginatedMostPopularmovies(
      int page);
  Future<Either<Failure, List<MovieEntity>>> getMoviesFromChosenGenres(
      ListGenresListMovies param);
}
