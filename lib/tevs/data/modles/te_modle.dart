import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';

class TvModle extends TvEntitie {
  const TvModle(
      {required super.name,
      required super.backdropPath,
      required super.id,
      required super.voteAverage,
      required super.firstAirDate,
      required super.overview});
  factory TvModle.fromJson(Map<String, dynamic> josn) => TvModle(
        name: josn['name'],
        backdropPath: josn['backdrop_path'] ??'/aWPhMZ0P2DyfWB7k5NXhGHSZHGC.jpg',
        id: josn['id'],
        voteAverage: josn['vote_average'].toDouble(),
        firstAirDate: josn['first_air_date'],
        overview: josn['overview'],
      );
}
