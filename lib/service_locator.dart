
import 'package:get_it/get_it.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/auth/repositories/auth.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/data/movie/repositories/movie.dart';
import 'package:netflix/data/movie/sources/movie.dart';
import 'package:netflix/data/tv/repositories/tv.dart';
import 'package:netflix/data/tv/sources/tv.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix/domain/auth/usecases/signin.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/domain/movie/usecases/get_movie_trailer.dart';
import 'package:netflix/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:netflix/domain/movie/usecases/get_similar_movies.dart';
import 'package:netflix/domain/movie/usecases/get_trending_movies.dart';
import 'package:netflix/domain/movie/usecases/search_movie.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/domain/tv/usecases/get_keywords.dart';
import 'package:netflix/domain/tv/usecases/get_popular_tv.dart';
import 'package:netflix/domain/tv/usecases/get_recommendation_tvs.dart';
import 'package:netflix/domain/tv/usecases/get_similar_tvs.dart';
import 'package:netflix/domain/tv/usecases/search_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  
  sl.registerSingleton<DioClient>(DioClient());
  

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  // Repostories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetSimilarTvsUseCase>(GetSimilarTvsUseCase());
  sl.registerSingleton<GetRecommendationTvsUseCase>(GetRecommendationTvsUseCase());
  sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());
  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase());
  sl.registerSingleton<SearchTVUseCase>(SearchTVUseCase());
}