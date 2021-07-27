import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/genre_repository.dart';

class GetMovieGenres implements UseCase<List<GenreEntity>, NoParams> {
  final IGenreRepository repository;

  GetMovieGenres(this.repository);

  @override
  Future<Either<Failure, List<GenreEntity>>> call(NoParams noParams) async {
    return await repository.getMovieGenres(noParams);
  }
}
