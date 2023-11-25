import 'dart:io';

import 'package:dartz/dartz.dart';


import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/remote_data_resources.dart';
import '../exceptions.dart';
import '../failure.dart';

class MovieRepositoryImpl extends MovieRepository{
  final RemoteDataSouces remoteDataSouces;

  MovieRepositoryImpl({required this.remoteDataSouces});
  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies()async {

  try {
    List<Movie> movies=[];
    final result= await remoteDataSouces.getMovies();
    

    return Right(result.toEntityList());

  } on ServerException catch (e){
    return Left(ServerFailure('$e'));
    
  }on SocketException {
    return const Left(ConnectionFailure('Failed to coonect to internet'));
  }
  }
  


}