import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/data/models/genre_model.dart';
import 'package:loopi_challenge/features/movies/data/models/production_country_model.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel(
      {required int id,
      required String? backdropPath,
      required String? posterPath,
      required String? title,
      required String? originalTitle,
      required double? popularity,
      required double? voteAverage,
      required int? voteCount,
      required String? releaseDate,
      required List<GenreModel>? genres,
      required List<ProductionCountryModel>? productionCountries,
      required String? overview,
      required int? budget,
      required int? revenue,
      required int? runtime,
      required status,
      required genreIds,
      required List<PeopleEntity>? credits})
      : super(
            id: id,
            backdropPath: backdropPath,
            posterPath: posterPath,
            title: title,
            originalTitle: originalTitle,
            popularity: popularity,
            voteAverage: voteAverage,
            voteCount: voteCount,
            releaseDate: releaseDate,
            genres: genres,
            productionCountries: productionCountries,
            overview: overview,
            budget: budget,
            revenue: revenue,
            runtime: runtime,
            status: status,
            genreIds: genreIds,
            credits: credits);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json['backdrop_path'] as String?,
        budget: json['budget'] as int?,
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'] as String?,
        productionCountries: (json['production_countries'] as List<dynamic>?)
            ?.map((e) =>
                ProductionCountryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        releaseDate: json['release_date'],
        revenue: json['revenue'] as int?,
        runtime: json['runtime'] as int?,
        status: json['status'] as String?,
        title: json['title'],
        voteAverage: json['vote_average'].runtimeType == int
            ? (json['vote_average']).toDouble()
            : json['vote_average'],
        voteCount: json['vote_count'],
        genreIds: (json['genre_ids'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList(),
        credits: [],
      );

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath!,
        'budget': budget!,
        'genres': genres?.cast<GenreModel>().map((e) => e.toJson()).toList(),
        'id': id,
        'original_title': originalTitle!,
        'overview': overview!,
        'popularity': popularity!,
        'poster_path': posterPath!,
        'production_countries': productionCountries
            ?.cast<ProductionCountryModel>()
            .map((e) => e.toJson())
            .toList(),
        'release_date': releaseDate,
        'revenue': revenue!,
        'runtime': runtime!,
        'status': status,
        'title': title,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
