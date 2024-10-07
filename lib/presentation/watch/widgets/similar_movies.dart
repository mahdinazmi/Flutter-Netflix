import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/widgets/movie/movie_card.dart';
import '../bloc/similar_movies_cubit.dart';
import '../bloc/similar_movies_state.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getSimilarMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit,SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoading){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is SimilarMoviesLoaded ){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Similar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.movies[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.movies.length
                  ),
                ),
              ],
            );
          }

          if (state is FailureLoadSimilarMovies) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      )
    );
  }
}