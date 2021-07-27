import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/home_controller.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/item_text_space_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/loopi_sliver_appbar_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/movie_info_text_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/movie_poster_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.getPaginatedMostPopularMovies(1);
    controller.scrollControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: store,
      onLoading: (context) => Stack(
        children: [Center(child: CircularProgressIndicator())],
      ),
      onError: (context, error) => Center(
        child: Text(
          'Ops! we have a problem, try again later.',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      onState: (context, List<MovieEntity> listMovieEntity) => Scaffold(
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            LoopiSliverAppBar(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 0, top: 16),
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
                                  child: listMovieEntity[index].posterPath != ''
                                      ? MoviePoster(
                                          posterUrl: listMovieEntity[index]
                                              .posterPath!,
                                        )
                                      : Center(),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 16, right: 16, bottom: 4),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listMovieEntity[index].title!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        "${listMovieEntity[index].originalTitle} / ${listMovieEntity[index].releaseDate == null ? 2021 : listMovieEntity[index].releaseDate?.substring(0, 4)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      ItemTextSpace(),
                                      MovieInfoText(
                                        label: "Popularity: ",
                                        value:
                                            "${listMovieEntity[index].popularity!.round().toString()}",
                                      ),
                                      Row(
                                        children: [
                                          MovieInfoText(
                                            label: "Votes: ",
                                            value:
                                                "${listMovieEntity[index].voteCount.toString()}",
                                          ),
                                          Text(
                                            " | ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          MovieInfoText(
                                            label: "Avg: ",
                                            value:
                                                "${listMovieEntity[index].voteAverage.toString()}",
                                          ),
                                        ],
                                      ),
                                      ItemTextSpace(),
                                      Text(
                                        "${listMovieEntity[index].overview}",
                                        maxLines: 5,
                                        style:
                                            Theme.of(context).textTheme.caption,
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
                  );
                },
                childCount: listMovieEntity.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Goes to filter page
          },
          splashColor: Color(0xFFB44692),
          elevation: 3,
          child: Icon(
            Icons.filter_alt,
            size: 30,
          ),
        ),
      ),
    );
  }
}
