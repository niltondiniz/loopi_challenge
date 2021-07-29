import 'package:flutter_triple/flutter_triple.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_cast_by_movie_id_usecase.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_from_id_usecase.dart';

class DetailController extends NotifierStore<Failure, MovieEntity> {
  final GetMovieFromIdUsecase movieUsecase;
  final GetMovieCastByMovieId peopleUsecase;
  DetailController(this.movieUsecase, this.peopleUsecase)
      : super(MovieEntity(
            id: 0,
            backdropPath: '',
            posterPath: '',
            title: '',
            originalTitle: '',
            popularity: 0,
            voteAverage: 0,
            voteCount: 0,
            releaseDate: '',
            genres: null,
            productionCountries: null,
            overview: '',
            budget: 0,
            revenue: 0,
            runtime: 0,
            status: '',
            genreIds: null,
            credits: null));

  getMovieFromId(int id) async {
    setLoading(true);

    final movieDetailResult = await movieUsecase(id);
    final movieCast = await getCastFromMovieId(id);

    movieDetailResult.fold((error) => setError(error), (success) {
      success.credits?.insertAll(0, movieCast);
      update(success);
    });

    setLoading(false);
  }

  String getGenres(List<GenreEntity> genresList) {
    String genres = "";
    for (var item in genresList) {
      genres = genres + " " + item.name;
    }

    return genres;
  }

  Future<List<PeopleEntity>> getCastFromMovieId(int id) async {
    late List<PeopleEntity> result;

    final movieCast = await peopleUsecase(id);
    movieCast.fold((error) => setError(error), (success) {
      result = success;
    });

    return result;
  }
}
