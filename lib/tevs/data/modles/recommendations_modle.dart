import 'package:cima_movies_clean/tevs/domain/entities/tv_recommendations_entiti.dart';

class TvRecommendationsModle extends RecommendationsEntiti {
  const TvRecommendationsModle({required super.backdropPath, required super.id});

  factory TvRecommendationsModle.fromJosn(Map<String, dynamic> josn) =>
  TvRecommendationsModle(backdropPath: josn['backdrop_path'] ?? '/aWPhMZ0P2DyfWB7k5NXhGHSZHGC.jpg', id: josn['id']);
}
