import 'package:clean_arc/features/movie/domain/entities/movies_entities.dart';

class MovieModel extends MovieEntities {
  const MovieModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        id: json["id"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
