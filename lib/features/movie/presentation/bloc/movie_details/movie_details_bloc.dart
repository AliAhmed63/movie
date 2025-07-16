import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc/core/utils/enums.dart';
import 'package:clean_arc/features/movie/domain/entities/movie_details.dart';
import 'package:clean_arc/features/movie/domain/entities/recommendation.dart';
import 'package:clean_arc/features/movie/domain/use_cases/get_movies_details.dart';
import 'package:clean_arc/features/movie/domain/use_cases/get_similar_movies_use_case.dart';
import 'package:equatable/equatable.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getSimilarMoviesUseCase)
      : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetSimilarMoviesEvent>(_getSimilarMoviesEvent);
  }
  final GetMoviesDetailsUseCase getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;

  Future<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(event.movieId);
    result.fold(
      (failure) {
        emit(state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: failure.message,
        ));
      },
      (movieDetails) {
        emit(state.copyWith(
          movieDetailsState: RequestState.success,
          movieDetails: movieDetails,
        ));
      },
    );
  }

  Future<void> _getSimilarMoviesEvent(
      GetSimilarMoviesEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getSimilarMoviesUseCase(event.movieId);
    result.fold(
      (failure) {
        emit(state.copyWith(
          similarMoviesState: RequestState.error,
          similarMoviesMessage: failure.message,
        ));
      },
      (similarMovies) {
        emit(state.copyWith(
          similarMoviesState: RequestState.success,
          similarMovies: similarMovies,
        ));
      },
    );
  }
}
