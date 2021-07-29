import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/detail_controller.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/cast_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_back_button_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_background_movie_image_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_info_row_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_movie_poster_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_background_gradiente.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/director_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/green_title_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/on_error_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/vertical_space_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/white_title_widget.dart';

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
    return ScopedBuilder(
      store: store,
      onLoading: (context) => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).accentColor,
        ),
      ),
      onError: (context, error) => Center(
        child: OnErrorWidget(),
      ),
      onState: (context, MovieEntity movie) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: DetailBackgroundMoviePosterWidget.backgroundPoster(movie),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration:
                    DetailbackgroundGradiente.GetBackgroundGradientMask(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpaceWidget(height: 180),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            DetailMoviePosterWidget(movie: movie),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(
                                    controller.getGenres(movie.genres!),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        VerticalSpaceWidget(height: 16),
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
                        DetailInfoRowWidget(movie: movie),
                        VerticalSpaceWidget(height: 32),
                        WhiteTitleWidget(text: "Cast"),
                        VerticalSpaceWidget(height: 16),
                        Container(
                          height: 150,
                          child: CastWidget(movieCast: movie.credits!),
                        ),
                        VerticalSpaceWidget(height: 16),
                        WhiteTitleWidget(text: "Director"),
                        VerticalSpaceWidget(height: 16),
                        Container(
                          height: 150,
                          child: DirectorWidget(movieCast: movie.credits!),
                        ),
                        VerticalSpaceWidget(height: 16),
                        GreenTitleWidget(text: "Synopsis"),
                        VerticalSpaceWidget(height: 16),
                        Text(
                          widget.movie.overview!,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DetailBackButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
