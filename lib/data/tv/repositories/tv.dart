import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/keyword.dart';
import 'package:netflix/common/helper/mapper/tv.dart';
import 'package:netflix/core/models/keyword.dart';
import 'package:netflix/data/tv/models/tv.dart';
import 'package:netflix/data/tv/sources/tv.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';

import '../../../service_locator.dart';

class TVRepositoryImpl extends TVRepository {


  @override
  Future<Either> getPopularTV() async {
     var returnedData = await sl<TVService>().getPopularTv();

    return returnedData.fold(
     (error) {
      return Left(error);
     } , 
    (data) {
      var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
      return Right(movies);
    }
    );
  }
  
  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnedData = await sl < TVService > ().getRecommendationTVs(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var returnedData = await sl < TVService > ().getSimilarTVs(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl < TVService > ().getKeywords(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> searchTV(String query) async {
    var returnedData = await sl < TVService > ().searchTV(query);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }

}