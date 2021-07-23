import 'package:equatable/equatable.dart';

class PeopleEntity extends Equatable {
  final String name;
  final String profilePath;
  final int order;
  final String job;

  PeopleEntity({
    required this.name,
    required this.profilePath,
    required this.order,
    required this.job,
  });

  @override
  List<Object?> get props => [
        name,
        profilePath,
        order,
        job,
      ];
}
