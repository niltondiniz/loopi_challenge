import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/people_entity.dart';

abstract class IPeopleRepository {
  Future<Either<Failure, PeopleEntity>> getPeopleFromMovieId(int id);
}
