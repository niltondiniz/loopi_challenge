import 'package:loopi_challenge/features/movies/domain/entities/trailer_entity.dart';

class TrailerModel extends TrailerEntity {
  TrailerModel({
    required key,
    required site,
    required name,
  }) : super(
          key: key,
          site: site,
          name: name,
        );

  factory TrailerModel.fromJson(Map<String, dynamic> json) => TrailerModel(
        key: json['key'],
        site: json['site'],
        name: json['name'],
      );
}
