import 'package:equatable/equatable.dart';

import 'genres_entiti.dart';
class DetailsEntiti extends Equatable {
  final String? backdropPath;
  final String name;
  final String overView;
  final String firstAirDate;
  final double voteAverage;
  final int seasonNumber;
  final int? runtime;
  final List<TvGenresEntiti> genres;

  const DetailsEntiti(
      {
      this.backdropPath,
      required this.name,
      required this.overView,
      required this.firstAirDate,
      required this.voteAverage,
      required this.seasonNumber,
      required this.genres,
      this.runtime,
      });

  @override
  List<Object?> get props => [
        backdropPath,
        name,
        overView,
        firstAirDate,
        voteAverage,
        seasonNumber,
        genres,
        runtime,
        // lastEpisode,
      ];
}
