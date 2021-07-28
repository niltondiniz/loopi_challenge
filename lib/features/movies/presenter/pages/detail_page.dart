import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/detail_controller.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_action_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_info_widget.dart';

class DetailPage extends StatefulWidget {
  final MovieEntity movie;
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController> {
  @override
  void initState() {
    super.initState();

    controller.getMovieFromId(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
              TheMovieDBEndpoint.movieMediaBaseUrlOriginalSize() +
                  widget.movie.posterPath!,
            ).image,
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstIn),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 180,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Hero(
                          tag: widget.movie.id,
                          child: CachedNetworkImage(
                            imageUrl: TheMovieDBEndpoint
                                    .movieMediaBaseUrl500Quality() +
                                widget.movie.posterPath!,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.movie.title!,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        widget.movie.originalTitle!,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailInfoWidget(
                            value: "21/07/2021",
                            label: "Lançamento",
                          ),
                          DetailActionWidget(
                            text: "125min",
                            icon: Icons.timer,
                            action: () {},
                          ),
                          DetailInfoWidget(
                            value: "100M",
                            label: "Orçamento",
                          ),
                          DetailInfoWidget(
                            value: widget.movie.revenue.toString(),
                            label: "Bilheteria",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Elenco",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      //ListView.builder(itemBuilder: itemBuilder)
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Sinopse",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        widget.movie.overview!,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
