import 'package:equatable/equatable.dart';

class RecommendationEntitie extends Equatable {
  final String backdropPath;
  final int id;
  const RecommendationEntitie({required this.backdropPath, required this.id});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
      ];
}
