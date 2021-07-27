import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/trailer_entity.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/trailer_repository.dart';

class GetMovieTrailersByMovieId implements UseCase<List<TrailerEntity>, int> {
  final ITrailerRepository repository;

  GetMovieTrailersByMovieId(this.repository);
  @override
  Future<Either<Failure, List<TrailerEntity>>> call(int params) async {
    return await repository.getMovieTrailersByMovieId(params);
  }
}
