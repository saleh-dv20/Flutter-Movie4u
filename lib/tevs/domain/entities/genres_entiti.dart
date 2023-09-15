import 'package:equatable/equatable.dart';

class TvGenresEntiti extends Equatable {
  final String name;

  const TvGenresEntiti({required this.name});

  @override
  List<Object?> get props =>[name];

}
