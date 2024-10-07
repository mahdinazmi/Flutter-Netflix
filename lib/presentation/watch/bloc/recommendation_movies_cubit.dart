import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/service_locator.dart';

import '../../../domain/movie/usecases/get_recommendation_movies.dart';
import 'recommendation_movies_state.dart';


class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());


  void getRecommendationMovies(int movieId) async {
    var returnedData = await sl<GetRecommendationMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error){
        emit(
          FailureLoadRecommendationMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          RecommendationMoviesLoaded(movies: data)
        );
      }
    );
  }
}