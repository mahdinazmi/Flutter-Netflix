import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix/service_locator.dart';

import 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());


  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          FailureLoadNowPlayingMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          NowPlayingMoviesLoaded(movies: data)
        );
      }
    );
  }
}