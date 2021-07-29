import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/home_controller.dart';
import 'package:loopi_challenge/features/movies/presenter/pages/filter_page.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/loopi_sliver_appbar_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/on_error_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/sliver_movie_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.filters = [];
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
      onError: (context, error) => Center(child: OnErrorWidget()),
      onState: (context, List<MovieEntity> listMovieEntity) => Scaffold(
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            LoopiSliverAppBarWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SliverMovieItemWidget(movie: listMovieEntity[index]);
                },
                childCount: listMovieEntity.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            controller.filters = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilterPage(),
              ),
            );
            controller.getMostPopularMovies(page: 1, useStateData: false);
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
