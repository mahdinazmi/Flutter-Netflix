import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/domain/movie/entities/movie.dart';
import 'package:netflix/presentation/watch/widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            VideoPlayer(id: movieEntity.id!)
          ],
        ),
      ),
    );
  }
}