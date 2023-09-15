import 'package:equatable/equatable.dart';

import 'genres.dart';

class DetailsMovieEntitie extends Equatable {
  final String backdropPath, overview, title, releaseDate;
  final int runtime, id;
  final double voteAverage;
  final List<GenresEntitie> genres;

  const DetailsMovieEntitie(
      {required this.releaseDate,
      required this.id,
      required this.backdropPath,
      required this.overview,
      required this.title,
      required this.runtime,
      required this.voteAverage,
      required this.genres});

  @override
  List<Object?> get props => [
        releaseDate,
        id,
        backdropPath,
        overview,
        title,
        runtime,
        voteAverage,
        genres
      ];
}
