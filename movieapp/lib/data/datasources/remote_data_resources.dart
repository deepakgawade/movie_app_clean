import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/data/models/movie_detail_model.dart';
import 'package:movieapp/data/models/movie_trailer_model.dart';

import '../models/movie_model.dart';

abstract class RemoteDataSouces {
  Future<MovieModelList> getMovies();
  Future<MovieDetailModel> getMovieDetails(String movieId);
  Future<MovieModelList> searchMovies(String keyword);
  Future<MovieTrailers> getMovieTrailers(String moviedId);
}
//https://api.themoviedb.org/3/movie/753342/videos?language=en-US&api_key=285f986dd22f9362676d75f84e049643
class GetMoviesRemote extends RemoteDataSouces {
  final Dio dio;

  GetMoviesRemote({required this.dio});
  var baseUrl = dotenv.env['BASE_URL'];
  var apikey = dotenv.env['API_KEY'];
  @override
  Future<MovieModelList> getMovies() async {


    try {
      final result = await dio.get('$baseUrl/upcoming?api_key=$apikey');
      print(result.data);

      final movie = MovieModelList.fromJson(result.data);

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<MovieDetailModel> getMovieDetails(String movieId) async{
   try {
      final result = await dio.get('$baseUrl/$movieId?api_key=$apikey');
      print(result.data);

      final movie = MovieDetailModel.fromJson(result.data);

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<MovieModelList> searchMovies(String keyword) async {
    try {
      final result = await dio.get('https://api.themoviedb.org/3/search/movie?query=$keyword&include_adult=false&language=en-US&page=1&api_key=$apikey');
      print(result.data);

      final movie = MovieModelList.fromJson(result.data);

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<MovieTrailers> getMovieTrailers(String moviedId) async {
    try {
      final result = await dio.get('$baseUrl/$moviedId/videos?language=en-US&api_key=$apikey');
      print(result.data);

      final movie = MovieTrailers.fromJson(result.data);

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
