import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/domain/entities/trailer_entity.dart';

abstract class ITrailerRepository {
  Future<Either<Failure, List<TrailerEntity>>> getMovieTrailersByMovieId(
      int id);
}
