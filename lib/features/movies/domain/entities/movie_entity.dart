import 'package:equatable/equatable.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';

import 'genre_entity.dart';
import 'production_country_entity.dart';

class MovieEntity extends Equatable {
  final int id;
  final String? backdropPath;
  final String? posterPath;
  final String? title;
  final String? originalTitle;
  final double? popularity;
  final double? voteAverage;
  final int? voteCount;
  final String? releaseDate;
  final List<GenreEntity>? genres;
  final List<ProductionCountryEntity>? productionCountries;
  final List<PeopleEntity>? credits;
  final String? overview;
  final int? budget;
  final int? revenue;
  final int? runtime;
  final String? status;
  final List<int>? genreIds;

  MovieEntity({
    required this.id,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.originalTitle,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.genres,
    required this.productionCountries,
    required this.overview,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.genreIds,
    required this.credits,
  });

  @override
  List<Object?> get props => [
        id,
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
        overview,
        budget,
        revenue,
        runtime,
        status,
        genreIds,
        credits,
      ];
}
