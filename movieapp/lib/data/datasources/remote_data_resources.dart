import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie_model.dart';

abstract class RemoteDataSouces{
  Future<MovieModelList> getMovies();

}


class GetMoviesRemote extends RemoteDataSouces{
  final Dio dio;

  GetMoviesRemote({required this.dio});
  @override
  Future<MovieModelList> getMovies() async {
   var baseUrl= dotenv.env['BASE_URL'];
   var apikey= dotenv.env['API_KEY'];

    try {
          final  result = await dio.get('$baseUrl/upcoming?api_key=$apikey');
   print(result.data);
 
         final movie = MovieModelList.fromJson(result.data);

       

   
   
      
             return movie;
    
   
      
    } catch (e) {
      print(e);
      rethrow ;
    }


  }

}