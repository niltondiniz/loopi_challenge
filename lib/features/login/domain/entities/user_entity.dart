import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String profileUrl;

  UserEntity({
    required this.name,
    required this.email,
    required this.profileUrl,
  });

  @override
  List<Object?> get props => [name, email, profileUrl];
}
