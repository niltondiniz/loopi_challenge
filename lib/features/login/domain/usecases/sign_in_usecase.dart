import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/login/domain/entities/user_entity.dart';
import 'package:loopi_challenge/features/login/domain/repositories/user_repository.dart';

class SignInUsecase extends UseCase<UserEntity, NoParams> {
  final IUserRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.signIn(params);
  }
}
