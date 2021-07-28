import 'package:loopi_challenge/features/movies/data/models/movie_model.dart';

abstract class IMovieDatasource {
  Future<MovieModel> getMovieFromId(int id);
  Future<List<MovieModel>> getPaginatedMostPopularMovies(int page);
}
