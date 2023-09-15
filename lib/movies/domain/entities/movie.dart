import 'package:equatable/equatable.dart';

class MovieEntitie extends Equatable {
  final int id;
  final List<int> genreIds;
  final String title, overview, backdropPath,releaseDate;
  final double voteAverage;

  const MovieEntitie({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        genreIds,
        title,
        overview,
        backdropPath,
        voteAverage,
        releaseDate,
      ];
}
