part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.similarMovies = const [],
    this.similarMoviesState = RequestState.loading,
    this.similarMoviesMessage = '',
  });

  final MovieDetailsEntities? movieDetails;
  final String movieDetailsMessage;
  final RequestState movieDetailsState;
  final List<RecommendationEntities> similarMovies ;
  final RequestState similarMoviesState ;
  final String similarMoviesMessage;

  MovieDetailsState copyWith({
    MovieDetailsEntities? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
     RequestState? similarMoviesState,
     String? similarMoviesMessage,
     List<RecommendationEntities>? similarMovies
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      similarMoviesState: similarMoviesState ?? this.similarMoviesState,
      similarMoviesMessage: similarMoviesMessage ?? this.similarMoviesMessage,
      similarMovies: similarMovies ?? this.similarMovies
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        similarMovies,
        similarMoviesState,
        similarMoviesMessage
      ];
}
