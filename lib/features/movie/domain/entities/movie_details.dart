import 'package:clean_arc/features/movie/domain/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetailsEntities extends Equatable {
  final String backdropPath;
  final String overview;
  final List<GenresEntities> genres;
  final int runtime;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int id;

  const MovieDetailsEntities({
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.genres,
    required this.runtime,
    required this.voteAverage,
    required this.id,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        overview,
        genres,
        releaseDate,
        title,
        runtime,
        voteAverage,
        id,
      ];
}
