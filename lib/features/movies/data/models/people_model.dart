import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';

class PeopleModel extends PeopleEntity {
  PeopleModel({
    required name,
    required profilePath,
    required order,
    required job,
  }) : super(
          name: name,
          profilePath: profilePath,
          order: order,
          job: job,
        );

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        name: json['name'],
        profilePath: json['profilePath'],
        order: json['order'],
        job: json['job'],
      );
}
