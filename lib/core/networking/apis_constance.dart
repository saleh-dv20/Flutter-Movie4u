class ApisConstance {
  static const String baseUril = 'https://api.themoviedb.org/3';
  static const String apiKey = 'a74dcf98f304175d2a12a0389f8c481f';
  static const String results = 'results';

  static const String nowPlayingMoviePath =
      '$baseUril/movie/now_playing?api_key=$apiKey';
  static const String popularPath = '$baseUril/movie/popular?api_key=$apiKey';
  static const String topDatedPath =
      '$baseUril/movie//top_rated?api_key=$apiKey';
  static const String baseImageUlr = 'https://image.tmdb.org/t/p/w500/';

  // Method........
  static String imagUlr(String path) => '$baseImageUlr$path';
  static String detailsPath(int movieId) =>
      '$baseUril/movie/$movieId?api_key=$apiKey';
  static String recommendationPath(int movieId) =>
      '$baseUril/movie/$movieId/recommendations?api_key=$apiKey';

  // Tv Constance ......
  static const onTheAirPath = '$baseUril/tv/on_the_air?api_key=$apiKey';
  static const tvPopular = '$baseUril/tv/popular?api_key=$apiKey';
  static const tvTopRated = '$baseUril/tv/top_rated?api_key=$apiKey';
  // Method.
  static String tvDetails(int tvId) => '$baseUril/tv/$tvId?api_key=$apiKey';
  static String tvRecommendation(int tvId) =>
      '$baseUril/tv/$tvId/recommendations?api_key=$apiKey';

  static String tvEpisodes(int tvId, int seasonNumber) {
    return '$baseUril/tv/$tvId/season/$seasonNumber?api_key=$apiKey';
  }
  //....... https://api.themoviedb.org/3/movie/now_playing?api_key=a74dcf98f304175d2a12a0389f8c481f
}
