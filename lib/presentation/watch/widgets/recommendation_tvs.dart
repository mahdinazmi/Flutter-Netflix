import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_cubit.dart';
import 'package:netflix/common/bloc/generic_data_state.dart';
import 'package:netflix/common/widgets/tv/tv_card.dart';
import 'package:netflix/domain/tv/entities/tv.dart';
import 'package:netflix/service_locator.dart';
import '../../../domain/tv/usecases/get_recommendation_tvs.dart';

class RecommendationTVs extends StatelessWidget {
  final int tvId;
  const RecommendationTVs({required this.tvId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<TVEntity>>(sl<GetRecommendationTvsUseCase>(),params: tvId),
      child: BlocBuilder<GenericDataCubit,GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is DataLoaded ){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TVCard(
                        tvEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.data.length
                  ),
                ),
              ],
            );
          }

          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      )
    );
  }
}