import 'package:loopi_challenge/core/enums/job_enum.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';

class PeopleModel extends PeopleEntity {
  PeopleModel({
    required String name,
    required String profilePath,
    required int order,
    required JobList job,
  }) : super(
          name: name,
          profilePath: profilePath,
          order: order,
          job: job,
        );

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        name: json['name'],
        profilePath: json['profile_path'] == null ? '' : json['profile_path'],
        order: json['order'] == null ? 0 : json['order'],
        job: json['job'] == 'Director' ? JobList.director : JobList.actor,
      );
}
