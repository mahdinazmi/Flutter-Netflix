import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/movie.dart';
import 'package:netflix/common/helper/mapper/trailer.dart';
import 'package:netflix/core/models/trailer.dart';
import 'package:netflix/data/movie/sources/movie.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/service_locator.dart';

import '../models/movie.dart';

class MovieRepositoryImpl extends MovieRepository {

  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await  sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
     (error) {
      return Left(error);
     } , 
    (data) {
      var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    }
    );
    
  }
  
  @override
  Future < Either > getNowPlayingMovies() async {
    var returnedData = await sl < MovieService > ().getNowPlayingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl < MovieService > ().getMovieTrailer(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData = await sl < MovieService > ().getRecommendationMovies(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var returnedData = await sl < MovieService > ().getSimilarMovies(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> searchMovie(String query) async {
     var returnedData = await sl < MovieService > ().searchMovie(query);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
}