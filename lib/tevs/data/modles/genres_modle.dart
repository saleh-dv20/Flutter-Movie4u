import '../../domain/entities/genres_entiti.dart';

class GenresModle extends TvGenresEntiti {
  const GenresModle({required super.name});

  factory GenresModle.fromJosn(Map<String, dynamic> josn) =>
      GenresModle(name: josn['name']);
}
