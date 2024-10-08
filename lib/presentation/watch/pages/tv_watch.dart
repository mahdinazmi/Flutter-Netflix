import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/domain/tv/entities/tv.dart';
import 'package:netflix/presentation/watch/widgets/video_player.dart';
import '../widgets/recommendation_tvs.dart';
import '../widgets/similar_tvs.dart';
import '../widgets/tv_keywords.dart';
import '../widgets/video_overview.dart';
import '../widgets/video_title.dart';
import '../widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TVWatchPage({required this.tvEntity,super.key});

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
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(height: 16,),
            VideoTitle(title: tvEntity.name!,),
            const SizedBox(height: 16,),
            TVKeywords(tvId: tvEntity.id!,),
            const SizedBox(height: 16,),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!,),
            const SizedBox(height: 16,),
            VideoOverview(overview: tvEntity.overview!,),
            const SizedBox(height: 16,),
            RecommendationTVs(tvId: tvEntity.id!,),
            const SizedBox(height: 16,),
            SimilarTVs(tvId: tvEntity.id!,)
          ],
        ),
      ),
    );
  }
}