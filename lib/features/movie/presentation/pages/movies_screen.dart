import 'package:clean_arc/core/helper/injection_container.dart';
import 'package:clean_arc/core/helper/spacing.dart';
import 'package:clean_arc/core/utils/enums.dart';
import 'package:clean_arc/features/movie/presentation/bloc/movie/movies_bloc.dart';
import 'package:clean_arc/features/movie/presentation/pages/movie_category.dart';
import 'package:clean_arc/features/movie/presentation/widgets/now_playing.dart';
import 'package:clean_arc/features/movie/presentation/widgets/popular_movie.dart';
import 'package:clean_arc/features/movie/presentation/widgets/section_header.dart';
import 'package:clean_arc/features/movie/presentation/widgets/top_rated_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NowPlaying(),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MovieCategoryScreen(
                        title: 'Popular Movies',
                        category: MovieCategoryType.popular,
                      ),
                    ),
                  );
                },
              ),
              PopularMovie(),
              SectionHeader(
                title: 'Top Rated',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MovieCategoryScreen(
                        title: 'Top Rated Movies',
                        category: MovieCategoryType.topRated,
                      ),
                    ),
                  );
                },
              ),
              TopRatedMovie(),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
