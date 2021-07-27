import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';

class MoviePoster extends StatelessWidget {
  final String posterUrl;
  const MoviePoster({
    Key? key,
    required this.posterUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: TheMovieDBEndpoint.movieMediaBaseUrl() + this.posterUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        width: 130,
        height: 150,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).accentColor,
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}