import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_cubit.dart';
import 'package:netflix/common/bloc/generic_data_state.dart';
import 'package:netflix/common/widgets/tv/tv_card.dart';
import 'package:netflix/domain/tv/entities/tv.dart';
import 'package:netflix/domain/tv/usecases/get_popular_tv.dart';
import 'package:netflix/service_locator.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<TVEntity>>(sl<GetPopularTVUseCase>()),
      child: BlocBuilder<GenericDataCubit,GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is DataLoaded ){
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(
                    tvEntity: state.data[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                itemCount: state.data.length
              ),
            );
          }

          if (state is FailureLoadData) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      )
    );
  }
}