import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/domain/movie/entities/movie.dart';
import 'package:netflix/presentation/watch/widgets/video_player.dart';

import '../widgets/recommendation_movies.dart';
import '../widgets/similar_movies.dart';
import '../widgets/video_overview.dart';
import '../widgets/video_release_date.dart';
import '../widgets/video_title.dart';
import '../widgets/video_vote_average.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(height: 16,),
            VideoTitle(title: movieEntity.title!,),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!,),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!,)
              ],
            ),
            const SizedBox(height: 16,),
            VideoOverview(overview: movieEntity.overview!,),
            const SizedBox(height: 16,),
            RecommendationMovies(movieId: movieEntity.id!,),
            const SizedBox(height: 16,),
            SimilarMovies(movieId: movieEntity.id!,)
          ],
        ),
      ),
    );
  }
}