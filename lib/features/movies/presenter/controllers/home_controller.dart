import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loopi_challenge/core/errors/failure.dart';
import 'package:loopi_challenge/features/movies/data/models/movie_model.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/domain/usecases/get_paginated_most_popular_movies_usecase.dart';

class HomeController extends NotifierStore<Failure, List<MovieEntity>> {
  final GetPaginatedMostPopularMoviesUsecase usecase;
  HomeController(this.usecase)
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

  final List<MovieModel> movieList = [];
  int loadedPages = 0;
  ScrollController scrollController = new ScrollController();

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
      final result = await usecase(page);
      result.fold((error) => setError(error), (success) {
        loadedPages = page;
        try {
          success.insertAll(0, state);
        } catch (e) {
          print(e);
        }
        update(success);
      });
    }
  }
}
