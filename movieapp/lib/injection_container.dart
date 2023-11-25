import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote_data_resources.dart';
import 'data/repositories/country_repository_impl.dart';
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

  // sl.registerSingleton<SaveArticleUseCase>(
  //   SaveArticleUseCase(sl())
  // );
  
  // sl.registerSingleton<RemoveArticleUseCase>(
  //   RemoveArticleUseCase(sl())
  // );


  //Blocs
  sl.registerFactory<MoviesBloc>(
    ()=> MoviesBloc(sl())
  );

  // sl.registerFactory<LocalArticleBloc>(
  //   ()=> LocalArticleBloc(sl(),sl(),sl())
  // );


}