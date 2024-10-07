import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/service_locator.dart';

import '../../../domain/movie/usecases/get_similar_movies.dart';
import 'similar_movies_state.dart';


class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoading());


  void getSimilarMovies(int movieId) async {
    var returnedData = await sl<GetSimilarMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error){
        emit(
          FailureLoadSimilarMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          SimilarMoviesLoaded(movies: data)
        );
      }
    );
  }
}