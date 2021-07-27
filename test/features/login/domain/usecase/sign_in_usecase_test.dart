import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/login/domain/entities/user_entity.dart';
import 'package:loopi_challenge/features/login/domain/repositories/user_repository.dart';
import 'package:loopi_challenge/features/login/domain/usecases/sign_in_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late SignInUsecase usecase;
  late IUserRepository repository;

  setUp(() {
    repository = MockUserRepository();
    usecase = SignInUsecase(repository);
  });

  final tLoggedUser = UserEntity(
    name: "Nilton Diniz",
    email: "niltondiniz@niltondiniz.com",
    profileUrl: "https://niltondiniz.com",
  );

  test("Should get a logged user", () async {
    //Arrange
    when(() => repository.signIn(NoParams()))
        .thenAnswer((_) async => Right(tLoggedUser));
    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Right(tLoggedUser));
  });
}
