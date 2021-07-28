import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';

class DetailMoviePosterWidget extends StatelessWidget {
  final MovieEntity movie;
  const DetailMoviePosterWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Hero(
        tag: movie.id,
        child: CachedNetworkImage(
          imageUrl: TheMovieDBEndpoint.movieMediaBaseUrl500Quality() +
              movie.posterPath!,
        ),
      ),
    );
  }
}
