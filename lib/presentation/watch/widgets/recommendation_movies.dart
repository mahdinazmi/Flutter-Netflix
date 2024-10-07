import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/widgets/movie/movie_card.dart';
import '../bloc/recommendation_movies_cubit.dart';
import '../bloc/recommendation_movies_state.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendationMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMoviesCubit,RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoading){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is RecommendationMoviesLoaded ){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendation',
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

          if (state is FailureLoadRecommendationMovies) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      )
    );
  }
}