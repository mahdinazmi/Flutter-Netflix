import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/get_trending_movies.dart';
import 'package:netflix/presentation/home/bloc/trendings_state.dart';
import 'package:netflix/service_locator.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingMoviesLoading());


  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          FailureLoadTrendingMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          TrendingMoviesLoaded(movies: data)
        );
      }
    );
  }
}