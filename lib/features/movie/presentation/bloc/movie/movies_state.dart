part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<MovieEntities> nowPlayingMoviesList;
  final RequestState nowPlayingState;
  final String nowPlayingMoviesMessage;
  final List<MovieEntities> popularMoviesList;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;
  final List<MovieEntities> topRatedMoviesList;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;

  const MoviesState({
    this.nowPlayingMoviesList = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMoviesMessage = '',
    this.popularMoviesList = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMoviesMessage = '',
    this.topRatedMoviesList = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesMessage = '',
  });
  MoviesState copyWith(
      {List<MovieEntities>? nowPlayingMoviesList,
      RequestState? nowPlayingState,
      String? nowPlayingMoviesMessage,
      List<MovieEntities>? popularMoviesList,
      RequestState? popularMoviesState,
      String? popularMoviesMessage,
      List<MovieEntities>? topRatedMoviesList,
      RequestState? topRatedMoviesState,
      String? topRatedMoviesMessage}) {
    return MoviesState(
        nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMoviesMessage:
            nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
        popularMoviesList: popularMoviesList ?? this.popularMoviesList,
        popularMoviesState: popularMoviesState ?? this.popularMoviesState,
        popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
        topRatedMoviesList: topRatedMoviesList ?? this.topRatedMoviesList,
        topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
        topRatedMoviesMessage:
            topRatedMoviesMessage ?? this.topRatedMoviesMessage);
  }

  @override
  List<Object> get props => [
        nowPlayingMoviesList,
        nowPlayingState,
        nowPlayingMoviesMessage,
        popularMoviesList,
        popularMoviesState,
        popularMoviesMessage,
        topRatedMoviesList,
        topRatedMoviesState,
        topRatedMoviesMessage
      ];
}

