import '../../domain/entities/episode_entitie.dart';

class EpisodesModle extends EpisodesEntitie {
  const EpisodesModle({
    required super.airDate,
    required super.name,
    required super.overView,
    required super.seasonNumber,
    required super.episodeNumber,
    required super.showId,
    super.stillPath
  });

  factory EpisodesModle.fromJosn(Map<String, dynamic> josn) {
    return EpisodesModle(
      airDate: josn['air_date'],
      name: josn['name'],
      overView: josn['overview'],
      stillPath: josn['still_path'] ?? '/fQ7OuKj24STjUUfutmfgvnlZWu8.jpg',
      seasonNumber: josn['season_number'],
      episodeNumber: josn['episode_number'],
      showId: josn['show_id'],
    );
  }
}
