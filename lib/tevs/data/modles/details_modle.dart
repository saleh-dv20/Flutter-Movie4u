import 'package:cima_movies_clean/tevs/domain/entities/details_entiti.dart';

import 'genres_modle.dart';

class DetailsModle extends DetailsEntiti {
  const DetailsModle({
    super.backdropPath,
    required super.name,
    required super.overView,
    required super.firstAirDate,
    required super.voteAverage,
    required super.seasonNumber,
    required super.genres,
    super.runtime,
  });

  factory DetailsModle.fromJosn(Map<String, dynamic> josn) => DetailsModle(
        backdropPath:
            josn['backdrop_path'] ?? '/aWPhMZ0P2DyfWB7k5NXhGHSZHGC.jpg',
        name: josn['name'],
        overView: josn['overview'],
        firstAirDate: josn['first_air_date'],
        voteAverage: josn['vote_average'],
        seasonNumber: josn['last_episode_to_air']['season_number'],
        runtime: josn['last_episode_to_air']['runtime'] ?? 30,
        genres: List.from(
          josn['genres'].map((x) => GenresModle.fromJosn(x)),
        ),
      );
}
