import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/service_locator.dart';

class GetSimilarTvsUseCase extends UseCase<Either,int> {
  
  @override
  Future<Either> call({int ? params}) async {
    return await sl<TVRepository>().getSimilarTVs(params!);
  }
  
}