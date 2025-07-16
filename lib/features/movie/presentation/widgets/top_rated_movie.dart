import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arc/core/utils/const.dart';
import 'package:clean_arc/core/utils/enums.dart';
import 'package:clean_arc/features/movie/presentation/bloc/movie/movies_bloc.dart';
import 'package:clean_arc/features/movie/presentation/pages/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedMovie extends StatelessWidget {
  const TopRatedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (prev, cur) =>
          prev.topRatedMoviesState != cur.topRatedMoviesState,
      builder: (context, state) {
        
        switch (state.topRatedMoviesState) {
          case RequestState.loading:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.success:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMoviesList.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMoviesList[index];

                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(id: movie.id),
                          ),
                        );
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                                BackendEndPoints.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return const Text('Top Rated Movies Error');
        }
      },
    );
  }
}
