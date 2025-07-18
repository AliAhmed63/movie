import 'package:equatable/equatable.dart';

class GenresEntities extends Equatable {
  final String name;
  final int id;

  const GenresEntities({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}
