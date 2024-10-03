import 'package:netflix/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingMoviesLoaded({required this.movies});
}

class FailureLoadNowPlayingMovies extends NowPlayingState {
  final String errorMessage;
  FailureLoadNowPlayingMovies({required this.errorMessage});
}