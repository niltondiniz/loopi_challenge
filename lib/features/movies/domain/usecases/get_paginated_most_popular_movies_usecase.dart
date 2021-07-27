import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/movie_repository.dart';

class GetPaginatedMostPopularMoviesUsecase
    extends UseCase<List<MovieEntity>, int> {
  final IMovieRepository repository;

  GetPaginatedMostPopularMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(int page) async {
    return await repository.getPaginatedMostPopularmovies(page);
  }
}
