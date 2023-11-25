import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/domain/usecases/get_movie_trailer.dart';
import 'package:movieapp/domain/usecases/search_movie.dart';

import 'data/datasources/remote_data_resources.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_movie_list.dart';
import 'presentation/bloc/movie_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  // Dio
sl.registerSingleton<Dio>(Dio());
  // Dependencies
  sl.registerSingleton<RemoteDataSouces>(GetMoviesRemote(dio: sl()));

  sl.registerSingleton<MovieRepository>(
    MovieRepositoryImpl(remoteDataSouces: sl())
  );
  
  //UseCases


  sl.registerSingleton<GetMovieList>(
    GetMovieList(movieRepository: sl())
  );
    sl.registerSingleton<GetMovieDetail>(
    GetMovieDetail(movieRepository: sl())
  );
    sl.registerSingleton<SearchMovie>(
    SearchMovie(movieRepository: sl())
  );
    sl.registerSingleton<GetMovieTrailer>(
    GetMovieTrailer(movieRepository: sl())
  );




  //Blocs
  sl.registerFactory<MoviesBloc>(
    ()=> MoviesBloc(sl(),sl(),sl(),sl())
  );



}