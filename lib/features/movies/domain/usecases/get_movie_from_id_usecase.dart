import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/repositories/movie_repository.dart';

class GetMovieFromIdUsecase implements UseCase<MovieEntity, int> {
  final IMovieRepository repository;

  GetMovieFromIdUsecase(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(int params) async {
    return await repository.getMovieFromId(params);
  }
}
