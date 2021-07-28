import 'package:flutter/material.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';

class DetailBackgroundMoviePosterWidget extends BoxDecoration {
  static BoxDecoration backgroundPoster(MovieEntity movie) {
    return BoxDecoration(
      image: DecorationImage(
        image: Image.network(
          TheMovieDBEndpoint.movieMediaBaseUrlOriginalSize() +
              movie.posterPath!,
        ).image,
        fit: BoxFit.fitHeight,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstIn),
      ),
    );
  }
}
