import 'package:netflix/domain/movie/entities/movie.dart';

abstract class TrendingsState {}

class TrendingMoviesLoading extends TrendingsState {}

class TrendingMoviesLoaded extends TrendingsState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class FailureLoadTrendingMovies extends TrendingsState {
  final String errorMessage;
  FailureLoadTrendingMovies({required this.errorMessage});
}