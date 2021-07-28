import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/data/models/genre_model.dart';

abstract class IGenreDatasource {
  Future<List<GenreModel>> getMovieGenre(NoParams noParams);
}
