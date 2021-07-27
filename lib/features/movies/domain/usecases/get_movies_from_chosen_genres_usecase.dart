import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/types/list_genres_list_movie_type.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/movie_repository.dart';

class GetmoviesFromChosenGenresUsecase
    extends UseCase<List<MovieEntity>, ListGenresListMovies> {
  final IMovieRepository repository;

  GetmoviesFromChosenGenresUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      ListGenresListMovies params) async {
    return await repository.getMoviesFromChosenGenres(params);
  }
}
