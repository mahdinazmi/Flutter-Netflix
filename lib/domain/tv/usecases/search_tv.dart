import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/service_locator.dart';

class SearchTVUseCase extends UseCase<Either,String> {
  
  @override
  Future<Either> call({String ? params}) async {
    return await sl<TVRepository>().searchTV(params!);
  }
  
}