import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/repositories/movie_repository.dart';

class GetMoviesFromChosenGenresUsecase
    extends UseCase<List<MovieEntity>, List<GenreEntity>> {
  final IMovieRepository repository;

  GetMoviesFromChosenGenresUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      List<GenreEntity> params) async {
    return await repository.getMoviesFromChosenGenres(params);
  }
}
