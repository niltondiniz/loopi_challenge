import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/movie_entity.dart';

abstract class IMovieRepository {
  Future<Either<Failure, MovieEntity>> getMovieFromId(int id);
  Future<Either<Failure, List<MovieEntity>>> getMostPopularMovies(
      NoParams param);
  Future<Either<Failure, List<MovieEntity>>> getMoviesFromChosenGenres(
      List<GenreEntity> params);
}
