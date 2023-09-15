import 'package:cima_movies_clean/movies/domain/entities/recommendation.dart';

class RecommendationModle extends RecommendationEntitie {
  const RecommendationModle({required super.backdropPath, required super.id});

 factory RecommendationModle.fromJosn(Map<String, dynamic> josn) =>
      RecommendationModle(
        backdropPath: josn['backdrop_path'],
        id: josn['id'],
      );
}
