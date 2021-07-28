import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/features/movies/data/datasources/genre_datasource.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/genre_repository.dart';

class GenreRepositoryImplementation implements IGenreRepository {
  final IGenreDatasource datasource;

  GenreRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, List<GenreEntity>>> getMovieGenres(
      NoParams noParams) async {
    try {
      final result = await datasource.getMovieGenre(noParams);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
