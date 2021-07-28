import 'package:loopi_challenge/core/errors/exceptions.dart';
import 'package:loopi_challenge/features/movies/data/datasources/people_datasource.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/people_repository.dart';

class PeopleRepositoryImplementation implements IPeopleRepository {
  final IPeopleDatasource datasource;

  PeopleRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, List<PeopleEntity>>> getMovieCastByMovieId(
      int id) async {
    try {
      final result = await datasource.getMoviesCastByMovieId(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
