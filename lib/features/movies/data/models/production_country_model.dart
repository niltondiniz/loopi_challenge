import 'package:loopi_challenge/features/movies/domain/entities/production_country_entity.dart';

class ProductionCountryModel extends ProductionCountryEntity {
  ProductionCountryModel({
    required acronym,
    required name,
  }) : super(
          acronym: acronym,
          name: name,
        );

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountryModel(
        acronym: json['iso_3166_1'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'iso_3166_1': acronym,
        'name': name,
      };
}
