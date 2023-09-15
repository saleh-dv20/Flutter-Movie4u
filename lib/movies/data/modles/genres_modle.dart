import '../../domain/entities/genres.dart';

class GenresModle extends GenresEntitie {
  const GenresModle({required super.name, required super.id});

  factory GenresModle.fromJosn(Map<String, dynamic> josn) => GenresModle(
        name: josn['name'],
        id: josn['id'],
      );
}
