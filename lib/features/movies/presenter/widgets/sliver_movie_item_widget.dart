import 'package:flutter/material.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/presenter/pages/detail_page.dart';

import 'item_text_space_widget.dart';
import 'movie_info_text_widget.dart';
import 'movie_poster_widget.dart';

class SliverMovieItemWidget extends StatelessWidget {
  final MovieEntity movie;
  const SliverMovieItemWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              movie: movie,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 16),
        child: Column(
          children: [
            Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: movie.posterPath != ''
                          ? MoviePosterWidget(
                              posterUrl: movie.posterPath!,
                              id: movie.id,
                            )
                          : Center(),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 0, top: 16, right: 16, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title!,
                            style: Theme.of(context).textTheme.headline3,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            "${movie.originalTitle} / ${movie.releaseDate == null ? 2021 : movie.releaseDate?.substring(0, 4)}",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          ItemTextSpaceWidget(),
                          MovieInfoTextWidget(
                            label: "Popularity: ",
                            value: "${movie.popularity!.round().toString()}",
                          ),
                          Row(
                            children: [
                              MovieInfoTextWidget(
                                label: "Votes: ",
                                value: "${movie.voteCount.toString()}",
                              ),
                              Text(
                                " | ",
                                style: TextStyle(color: Colors.white),
                              ),
                              MovieInfoTextWidget(
                                label: "Avg: ",
                                value: "${movie.voteAverage.toString()}",
                              ),
                            ],
                          ),
                          ItemTextSpaceWidget(),
                          Text(
                            "${movie.overview}",
                            maxLines: 5,
                            style: Theme.of(context).textTheme.caption,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
