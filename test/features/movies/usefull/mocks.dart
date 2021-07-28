import 'package:loopi_challenge/core/enums/job_enum.dart';
import 'package:loopi_challenge/features/movies/data/models/genre_model.dart';
import 'package:loopi_challenge/features/movies/data/models/movie_model.dart';
import 'package:loopi_challenge/features/movies/data/models/people_model.dart';
import 'package:loopi_challenge/features/movies/data/models/production_country_model.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/entities/production_country_entity.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';
import 'package:loopi_challenge/features/movies/domain/entities/trailer_entity.dart';

final movieMock = MovieEntity(
  id: 500,
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
  budget: 1000,
  overview: 'Um filme de teste',
  revenue: 1000,
  runtime: 90,
  status: 'Released',
  genreIds: [80],
  credits: [],
);

final movieMock2 = MovieEntity(
  id: 501,
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
  budget: 1000,
  overview: 'Um filme de teste',
  revenue: 1000,
  runtime: 90,
  status: 'Released',
  genreIds: [53],
  credits: [],
);

final listMovieMock = [movieMock, movieMock2];

final peopleMock1 = PeopleEntity(
  name: "Brad Pitty",
  profilePath: "/wpoefiwjef.jpg",
  order: 1,
  job: JobList.actor,
  gender: 1,
);

final peopleMock2 = PeopleEntity(
  name: "Angelina Jolie",
  profilePath: "/wpoefiwjef.jpg",
  order: 2,
  job: JobList.actor,
  gender: 1,
);

final peopleModelMock1 = PeopleModel(
  name: "Edward Norton",
  profilePath: "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
  order: 0,
  job: JobList.actor,
  gender: 1,
);

final peopleModelMock2 = PeopleModel(
  name: "Brad Pitt",
  profilePath: "/oTB9vGIBacH5aQNS0pUM74QSWuf.jpg",
  order: 1,
  job: JobList.director,
  gender: 1,
);

final movieCastMock = [peopleMock1, peopleMock2];
final movieCastModelMock = [peopleModelMock1, peopleModelMock2];

final actionGenre = GenreEntity(id: 1, name: "Action");
final romanceGenre = GenreEntity(id: 2, name: "Romance");
final listGenreMock = [actionGenre, romanceGenre];

final actionGenreModel = GenreModel(id: 1, name: "Action");
final romanceGenreModel = GenreModel(id: 2, name: "Romance");
final listGenreModelMock = [actionGenreModel, romanceGenreModel];

final firstTrailerMock =
    TrailerEntity(key: "asdfe", site: "Youtube", name: "trailerOne");
final secondTrailerMock =
    TrailerEntity(key: "fewe", site: "Youtube", name: "trailerTwo");
final listTrailerMock = [firstTrailerMock, secondTrailerMock];

final movieModelMock = MovieModel(
  id: 500,
  backdropPath: "/g6R1OT7ETBLGLeUJOE0pOiAFHcI.jpg",
  posterPath: "/84dzLDiFiACIqKtqQwzmB6GL7uC.jpg",
  title: "Cães de Aluguel",
  originalTitle: "Reservoir Dogs",
  popularity: 24.708,
  voteAverage: 8.2,
  voteCount: 10771,
  releaseDate: "1992-09-02",
  genres: [
    GenreModel(id: 80, name: "Criminal"),
    GenreModel(id: 53, name: "Thriller"),
  ],
  productionCountries: [
    ProductionCountryModel(
      acronym: "US",
      name: "United States of America",
    ),
  ],
  budget: 1200000,
  overview:
      'Uma gangue de ladrões, fugindo de um assalto bem-sucedido, encontra-se em um armazém. O problema é que a polícia está atrás deles, e cada um começa então a desconfiar que possa haver um traidor no grupo. O filme tem uma montagem que mostra as cenas no armazém intercalando-se com flashbacks da preparação para o crime, até um final surpreendente. Roteiro inteligente, na ótima estréia de Quentin Tarantino na direção.',
  revenue: 2859750,
  runtime: 99,
  status: 'Released',
  genreIds: [53],
  credits: [],
);

final movieModelMock2 = MovieModel(
  id: 501,
  backdropPath: "/g6R1OT7ETBLGLeUJOE0pOiAFHcI.jpg",
  posterPath: "/w185/84dzLDiFiACIqKtqQwzmB6GL7uC.jpg",
  title: "Cães de Aluguel 2",
  originalTitle: "Reservoir Dogs",
  popularity: 24.708,
  voteAverage: 8.2,
  voteCount: 10771,
  releaseDate: "1992-09-02",
  genres: [
    GenreModel(id: 80, name: "Criminal"),
    GenreModel(id: 53, name: "Thriller"),
  ],
  productionCountries: [
    ProductionCountryModel(
      acronym: "US",
      name: "United States of America",
    ),
  ],
  budget: 1200000,
  overview:
      'Uma gangue de ladrões, fugindo de um assalto bem-sucedido, encontra-se em um armazém. O problema é que a polícia está atrás deles, e cada um começa então a desconfiar que possa haver um traidor no grupo. O filme tem uma montagem que mostra as cenas no armazém intercalando-se com flashbacks da preparação para o crime, até um final surpreendente. Roteiro inteligente, na ótima estréia de Quentin Tarantino na direção.',
  revenue: 2859750,
  runtime: 99,
  status: 'Released',
  genreIds: [80],
  credits: [],
);

final listMovieModelMock = [movieModelMock, movieModelMock2];

const movieCastMockFromJson = """ 
  {
    "cast": 
      [
        {
          "adult": false,
          "gender": 1,
          "id": 1245,
          "known_for_department": "Acting",
          "name": "Scarlett Johansson",
          "original_name": "Scarlett Johansson",
          "popularity": 72.193,
          "profile_path": "/6NsMbJXRlDZuDzatN2akFdGuTvx.jpg",
          "cast_id": 3,
          "character": "Natasha Romanoff / Black Widow",
          "credit_id": "5a57030fc3a3685ed703622e",
          "order": 0
        },
        {
          "adult": false,
          "gender": 1,
          "id": 1373737,
          "known_for_department": "Acting",
          "name": "Florence Pugh",
          "original_name": "Florence Pugh",
          "popularity": 43.039,
          "profile_path": "/75PvULemW8BvheSKtPMoBBsvPLh.jpg",
          "cast_id": 20,
          "character": "Yelena Belova",
          "credit_id": "5ca5267fc3a3685aad0d51ca",
          "order": 1
        }
      ],
       "crew": 
        [
          {
            "adult": false,
            "gender": 0,
            "id": 1458695,
            "known_for_department": "Crew",
            "name": "Adam Banks",
            "original_name": "Adam Banks",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "5d6336966dea3a492593c4f9",
            "department": "Crew",
            "job": "Special Effects Technician"
          },
          {
            "adult": false,
            "gender": 0,
            "id": 1463522,
            "known_for_department": "Editing",
            "name": "Jess Jansen",
            "original_name": "Jess Jansen",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "60ef31310f0da5005fd52c47",
            "department": "Editing",
            "job": "Assistant Editor"
          }
        ]
      } """;

const movieMockFromJson = """

  {
    "backdrop_path": "/g6R1OT7ETBLGLeUJOE0pOiAFHcI.jpg",
    "budget": 1200000,
    "genres": [
        {
            "id": 80,
            "name": "Criminal"
        },
        {
            "id": 53,
            "name": "Thriller"
        }
    ],
    "id": 500,
    "original_title": "Reservoir Dogs",
    "overview": "Uma gangue de ladrões, fugindo de um assalto bem-sucedido, encontra-se em um armazém. O problema é que a polícia está atrás deles, e cada um começa então a desconfiar que possa haver um traidor no grupo. O filme tem uma montagem que mostra as cenas no armazém intercalando-se com flashbacks da preparação para o crime, até um final surpreendente. Roteiro inteligente, na ótima estréia de Quentin Tarantino na direção.",
    "popularity": 24.708,
    "poster_path": "/84dzLDiFiACIqKtqQwzmB6GL7uC.jpg",
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "1992-09-02",
    "revenue": 2859750,
    "runtime": 99,
    "status": "Released",
    "title": "Cães de Aluguel",
    "vote_average": 8.2,
    "vote_count": 10771,
    "genre_ids": [53],
    "credits":[]
}

 """;

const genreListMockFromJson = """ {
    "genres": [
        {
            "id": 28,
            "name": "Ação"
        },
        {
            "id": 12,
            "name": "Aventura"
        },
        {
            "id": 16,
            "name": "Animação"
        },
        {
            "id": 35,
            "name": "Comédia"
        },
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 99,
            "name": "Documentário"
        },
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 10751,
            "name": "Família"
        },
        {
            "id": 14,
            "name": "Fantasia"
        },
        {
            "id": 36,
            "name": "História"
        },
        {
            "id": 27,
            "name": "Terror"
        },
        {
            "id": 10402,
            "name": "Música"
        },
        {
            "id": 9648,
            "name": "Mistério"
        },
        {
            "id": 10749,
            "name": "Romance"
        },
        {
            "id": 878,
            "name": "Ficção científica"
        },
        {
            "id": 10770,
            "name": "Cinema TV"
        },
        {
            "id": 53,
            "name": "Thriller"
        },
        {
            "id": 10752,
            "name": "Guerra"
        },
        {
            "id": 37,
            "name": "Faroeste"
        }
    ]
} """;
