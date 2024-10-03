import 'package:dartz/dartz.dart';

abstract class MovieRepository {

  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
}