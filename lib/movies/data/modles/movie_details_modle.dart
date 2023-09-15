import 'package:cima_movies_clean/movies/domain/entities/details.dart';

import 'genres_modle.dart';

class DetailsMovieModle extends DetailsMovieEntitie {
  const DetailsMovieModle({
    required super.releaseDate,
    required super.id,
    required super.backdropPath,
    required super.overview,
    required super.title,
    required super.runtime,
    required super.voteAverage,
    required super.genres,
  });
  factory DetailsMovieModle.fromJosn(Map<String, dynamic> josn) =>
      DetailsMovieModle(
        releaseDate: josn['release_date'],
        id: josn['id'],
        backdropPath: josn['backdrop_path'],
        overview: josn['overview'],
        title: josn['title'],
        runtime: josn['runtime'],
        voteAverage: josn['vote_average'].toDouble(),
        genres: List<GenresModle>.from(
          (josn['genres'] as List).map((e) => GenresModle.fromJosn(e))
        ),
      );
}
