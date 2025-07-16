import 'package:clean_arc/features/movie/domain/entities/genres.dart';

class GenresModel extends GenresEntities {
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(id: json['id'], name: json['name']);
}
