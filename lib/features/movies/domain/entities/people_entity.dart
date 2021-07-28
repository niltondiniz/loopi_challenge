import 'package:equatable/equatable.dart';
import 'package:loopi_challenge/core/enums/job_enum.dart';

class PeopleEntity extends Equatable {
  final String name;
  final String profilePath;
  final int order;
  final JobList job;
  final int gender;

  PeopleEntity(
      {required this.name,
      required this.profilePath,
      required this.order,
      required this.job,
      required this.gender});

  @override
  List<Object?> get props => [
        name,
        profilePath,
        order,
        job,
        gender,
      ];
}
