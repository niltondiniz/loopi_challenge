import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/core/types/list_genres_list_movie_type.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_movies_from_chosen_genres_usecase.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_paginated_most_popular_movies_usecase.dart';

// ignore: must_be_immutable
class HomeController extends NotifierStore<Failure, List<MovieEntity>> {
  final GetPaginatedMostPopularMoviesUsecase usecase;
  final GetmoviesFromChosenGenresUsecase filterUsecase;
  HomeController(this.usecase, this.filterUsecase)
      : super([
          MovieEntity(
              id: 0,
              backdropPath: '',
              posterPath: '',
              title: '',
              originalTitle: '',
              popularity: 0,
              voteAverage: 0,
              voteCount: 0,
              releaseDate: '',
              genres: null,
              productionCountries: null,
              overview: '',
              budget: 0,
              revenue: 0,
              runtime: 0,
              status: '',
              genreIds: null,
              credits: null)
        ]);

  int loadedPages = 0;
  ScrollController scrollController = new ScrollController();
  List<int> filters = [];

  scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getPaginatedMostPopularMovies(loadedPages + 1);
      }
    });
  }

  goToLastItemOfListView() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  getPaginatedMostPopularMovies(int page) async {
    if (page == 1) {
      setLoading(true);
    }

    if (page > loadedPages) {
      await getMostPopularMovies(page: page);
    }
  }

  Future<void> getMostPopularMovies(
      {required int page, bool useStateData = true}) async {
    final result = await usecase(page);
    result.fold((error) => setError(error), (success) async {
      loadedPages = page;
      try {
        if (useStateData) {
          if (state[0].id != 0) {
            for (var movie in state.reversed) {
              success.insert(0, movie);
            }
          }
        }
        final filteredResult = await filterUsecase(
            ListGenresListMovies(genres: filters, moviesToFilter: success));
        filteredResult.fold((filterError) => setError(filterError),
            (filterSuccess) {
          filterSuccess.sort((a, b) => b.popularity!.compareTo(a.popularity!));
          update(filterSuccess);
        });
      } catch (e) {
        //throw e;
      }
    });
  }
}
