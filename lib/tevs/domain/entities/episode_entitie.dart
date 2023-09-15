import 'package:equatable/equatable.dart';

class EpisodesEntitie extends Equatable {
  final String airDate;
  final String name;
  final String overView;
  final String? stillPath;
  final int seasonNumber;
  final int episodeNumber;
  final int showId;

  const EpisodesEntitie({
    required this.airDate,
    required this.name,
    required this.overView,
    this.stillPath,
    required this.seasonNumber,
    required this.episodeNumber,
    required this.showId,
  });

  @override
  List<Object?> get props => [
        airDate,
        name,
        overView,
        stillPath,
        seasonNumber,
        episodeNumber,
        showId,
      ];
}
