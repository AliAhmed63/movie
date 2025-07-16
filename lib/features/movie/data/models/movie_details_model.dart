import 'package:clean_arc/features/movie/data/models/genres_model.dart';
import 'package:clean_arc/features/movie/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetailsEntities {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.overview,
      required super.releaseDate,
      required super.title,
      required super.genres,
      required super.runtime,
      required super.voteAverage,
      required super.id});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        title: json['title'],
        genres: List<GenresModel>.from(
            json['genres'].map((e) => GenresModel.fromJson(e))),
        runtime: json['runtime'],
        voteAverage: json['vote_average'],
        id: json['id']);
  }
}
