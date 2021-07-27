import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';
import 'package:loopi_challenge/features/movies/domain/repositories/people_repository.dart';

class GetMovieCastByMovieId implements UseCase<List<PeopleEntity>, int> {
  final IPeopleRepository repository;

  GetMovieCastByMovieId(this.repository);
  @override
  Future<Either<Failure, List<PeopleEntity>>> call(int params) async {
    return await repository.getMovieCastByMovieId(params);
  }
}
