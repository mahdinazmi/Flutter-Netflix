class ApiUrl {

  static const baseURL = 'http://192.168.1.8:5000/'; 
  static const apiV = 'api/v1/';
  
  static const signup = '${apiV}auth/signup';
  static const signin = '${apiV}auth/signin';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';
  static const popularTV = '${apiV}tv/popular';
  static const movie = '${apiV}movie/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}