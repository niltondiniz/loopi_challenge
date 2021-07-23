import 'package:loopi_challenge/features/Movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/Movies/domain/entities/production_country_entity.dart';

final movieMock = MovieEntity(
  backdropPath: "/8s4h9friP6Ci3adRGahHARVd76E.jpg",
  posterPath: "/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg",
  title: "Space Jam: Um Novo Legado",
  originalTitle: "Space Jam: A New Legacy",
  popularity: 10021.745,
  voteAverage: 8,
  voteCount: 3002,
  releaseDate: "2021-06-30",
  genres: [
    GenreEntity(id: 80, name: "Criminal"),
    GenreEntity(id: 53, name: "Thriller"),
  ],
  productionCountries: [
    ProductionCountryEntity(
      acronym: "US",
      name: "United State of America",
    ),
  ],
);

final listMovieMock = [movieMock];
