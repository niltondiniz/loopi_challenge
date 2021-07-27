import 'package:equatable/equatable.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';

class ListGenresListMovies extends Equatable {
  final List<int> genres;
  final List<MovieEntity> moviesToFilter;

  ListGenresListMovies({required this.genres, required this.moviesToFilter});

  @override
  List<Object?> get props => [
        genres,
        moviesToFilter,
      ];
}
