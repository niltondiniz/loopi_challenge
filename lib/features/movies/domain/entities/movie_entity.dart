import 'package:equatable/equatable.dart';

import 'genre_entity.dart';
import 'production_country_entity.dart';

class MovieEntity extends Equatable {
  final String backdropPath;
  final String posterPath;
  final String title;
  final String originalTitle;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List<GenreEntity> genres;
  final List<ProductionCountryEntity> productionCountries;

  MovieEntity(
      {required this.backdropPath,
      required this.posterPath,
      required this.title,
      required this.originalTitle,
      required this.popularity,
      required this.voteAverage,
      required this.voteCount,
      required this.releaseDate,
      required this.genres,
      required this.productionCountries});

  @override
  List<Object?> get props => [
        backdropPath,
        posterPath,
        title,
        originalTitle,
        popularity,
        voteAverage,
        voteCount,
        releaseDate,
        genres,
        productionCountries,
      ];
}
