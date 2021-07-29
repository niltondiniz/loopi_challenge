import 'package:flutter_triple/flutter_triple.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movie_genres.dart';

// ignore: must_be_immutable
class FilterController extends NotifierStore<Failure, List<GenreEntity>> {
  final GetMovieGenres usecase;

  FilterController(this.usecase)
      : super([
          GenreEntity(
            id: 0,
            name: '',
          )
        ]);

  List<int> filterGenres = [];
  List<bool> checkedGenres = [];

  List<int> selectedGenres(List<GenreEntity> genreList) {
    List<int> chosenGenres = [];
    int index = 0;

    for (var item in checkedGenres) {
      if (item) {
        chosenGenres.add(genreList[index].id);
      }

      index++;
    }

    return chosenGenres;
  }

  getGenres(NoParams noParams) async {
    setLoading(true);

    final result = await usecase(noParams);

    result.fold((error) => setError(error), (success) => update(success));
  }
}
