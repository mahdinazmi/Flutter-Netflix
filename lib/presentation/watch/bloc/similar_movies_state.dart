import 'package:netflix/domain/movie/entities/movie.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> movies;
  SimilarMoviesLoaded({required this.movies});
}

class FailureLoadSimilarMovies extends SimilarMoviesState {
  final String errorMessage;
  FailureLoadSimilarMovies({required this.errorMessage});
}