import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';

class MoviePosterWidget extends StatelessWidget {
  final String posterUrl;
  final int id;
  const MoviePosterWidget({
    Key? key,
    required this.posterUrl,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: CachedNetworkImage(
        imageUrl:
            TheMovieDBEndpoint.movieMediaBaseUrl500Quality() + this.posterUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).accentColor,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
