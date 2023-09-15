import 'package:equatable/equatable.dart';

class GenresEntitie extends Equatable {
  final String name;
  final int id;

  const GenresEntitie({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [id , name,];
}
