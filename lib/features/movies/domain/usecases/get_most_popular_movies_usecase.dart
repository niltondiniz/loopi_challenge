import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/repositories/movie_repository.dart';

class GetMostPopularMoviesUsecase extends UseCase<List<MovieEntity>, NoParams> {
  final IMovieRepository repository;

  GetMostPopularMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getMostPopularMovies(params);
  }
}
