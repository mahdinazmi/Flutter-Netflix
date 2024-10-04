import 'package:netflix/domain/tv/entities/tv.dart';

abstract class PopularTVState {}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final List<TVEntity> tv;
  PopularTVLoaded({required this.tv});
}

class FailureLoadPopularTV extends PopularTVState {
  final String errorMessage;
  FailureLoadPopularTV({required this.errorMessage});
}