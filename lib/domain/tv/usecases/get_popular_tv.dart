import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/service_locator.dart';

class GetPopularTVUseCase extends UseCase<Either,dynamic> {
  
  @override
  Future<Either> call({params}) async {
    return await sl<TVRepository>().getPopularTV();
  }
  
}