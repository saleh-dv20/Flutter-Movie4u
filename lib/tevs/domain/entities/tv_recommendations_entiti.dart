import 'package:equatable/equatable.dart';

class RecommendationsEntiti extends Equatable {
  final String? backdropPath;
  final int id;

  const RecommendationsEntiti({this.backdropPath, required this.id});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
      ];
}
