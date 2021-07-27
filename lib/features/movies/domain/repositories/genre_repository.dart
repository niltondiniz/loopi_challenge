import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';

abstract class IGenreRepository {
  Future<Either<Failure, List<GenreEntity>>> getMovieGenres(NoParams noParams);
}
