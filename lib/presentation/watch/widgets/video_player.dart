import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/watch/bloc/trailer_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../bloc/trailer_state.dart';

class VideoPlayer extends StatelessWidget {
  final int id;
  const VideoPlayer({required this.id,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(id),
      child: BlocBuilder<TrailerCubit,TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
            );
          }
          if (state is FailuerLoadTrailer) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      )
    );
  }
}