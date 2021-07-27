class TheMovieDBEndpoint {
  static String movie(String movieId, String apiKey) =>
      "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=pt-BR";

  static String paginatedMostPopularMovies(String apiKey, String page) =>
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=pt-BR&page=$page";

  static String movieMediaBaseUrl() => "https://image.tmdb.org/t/p/w185";
}
