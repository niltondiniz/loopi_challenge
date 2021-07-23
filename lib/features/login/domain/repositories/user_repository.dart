import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/login/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserEntity>> signIn(NoParams noParam);
  Future<Either<Failure, bool>> signOut(NoParams noParam);
}
