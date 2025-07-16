import 'package:equatable/equatable.dart';
//هنا بنستخدم الانتيتي من غير فروم جيسون ولا تو جيسون دا البور الي بنستخدمة لعرض الداتا داخل التطبيق
//
//

class MovieEntities extends Equatable {
  final String backdropPath;
  final int id;
  final List<int> genreIds;

  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;

  const MovieEntities({
    required this.backdropPath,
    required this.id,
    required this.genreIds,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        genreIds,
        overview,
        releaseDate,
        title,
        voteAverage,
      ];
}
