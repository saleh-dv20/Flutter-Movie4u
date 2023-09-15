import 'package:cima_movies_clean/movies/domain/entities/movie.dart';

class MovieModle extends MovieEntitie {
  const MovieModle({
    required super.id,
    required super.genreIds,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModle.formJson(Map<String, dynamic> josn) => MovieModle(
        id: josn['id'],
        genreIds: List<int>.from(josn['genre_ids'].map((e) => e)),
        title: josn['title'],
        overview: josn['overview'],
        backdropPath: josn['backdrop_path'],
        voteAverage: josn['vote_average'].toDouble(),
        releaseDate: josn['release_date'],
      );
}
