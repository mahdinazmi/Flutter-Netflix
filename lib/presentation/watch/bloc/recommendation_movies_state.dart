import 'package:netflix/domain/movie/entities/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movies;
  RecommendationMoviesLoaded({required this.movies});
}

class FailureLoadRecommendationMovies extends RecommendationMoviesState {
  final String errorMessage;
  FailureLoadRecommendationMovies({required this.errorMessage});
}