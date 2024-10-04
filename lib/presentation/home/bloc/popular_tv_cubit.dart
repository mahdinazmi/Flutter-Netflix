import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/service_locator.dart';

import '../../../domain/tv/usecases/get_popular_tv.dart';
import 'popular_tv_state.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());


  void getPopularTV() async {
    var returnedData = await sl<GetPopularTVUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          FailureLoadPopularTV(errorMessage: error)
        );
      },
      (data){
        emit(
          PopularTVLoaded(tv: data)
        );
      }
    );
  }
}