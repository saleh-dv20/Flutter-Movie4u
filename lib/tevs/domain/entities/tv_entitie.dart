import 'package:equatable/equatable.dart';

class TvEntitie extends Equatable {
  final String name;
  final String? backdropPath;
  final String firstAirDate;
  final String overview;
  final int id;
  final double voteAverage;

  const TvEntitie({
    required this.name,
    this.backdropPath,
    required this.id,
    required this.voteAverage,
    required this.firstAirDate,
    required this.overview,
  });

  @override
  List<Object?> get props =>
      [name, id, voteAverage, backdropPath, firstAirDate, overview];
}
