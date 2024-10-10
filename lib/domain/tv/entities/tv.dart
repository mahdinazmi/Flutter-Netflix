import '../../../core/configs/assets/app_images.dart';

class TVEntity {
  TVEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool ? adult;
  final String ? backdropPath;
  final List < int > genreIds;
  final int ? id;
  final List < String > originCountry;
  final String ? originalLanguage;
  final String ? originalName;
  final String ? overview;
  final double ? popularity;
  final String ? posterPath;
  final DateTime ? firstAirDate;
  final String ? name;
  final double ? voteAverage;
  final int ? voteCount;

  String providePosterPath() {
    return  posterPath != null ? AppImages.movieImageBasePath + posterPath! :  
    AppImages.defaultImage;
  }
}
