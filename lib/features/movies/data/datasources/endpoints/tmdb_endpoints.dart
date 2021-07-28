class TheMovieDBEndpoint {
  static String movie(String movieId, String apiKey) =>
      "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=pt-BR";

  static String credits(String movieId, String apiKey) =>
      "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=pt-BR";

  static String paginatedMostPopularMovies(String apiKey, String page) =>
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=pt-BR&page=$page";

  static String movieMediaBaseUrl185Quality() =>
      "https://image.tmdb.org/t/p/w185";

  static String movieMediaBaseUrlOriginalSize() =>
      "https://image.tmdb.org/t/p/original";

  static String movieMediaBaseUrl500Quality() =>
      "https://image.tmdb.org/t/p/w500";

  static String genres(String apiKey) =>
      "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=pt-BR";
}
