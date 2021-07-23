import 'package:loopi_challenge/features/login/domain/entities/user_entity.dart';

abstract class LoginProvider {
  Future<UserEntity> login();
}
