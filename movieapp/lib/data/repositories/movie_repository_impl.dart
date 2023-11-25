import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/movie_detail.dart';
import 'package:movieapp/domain/entities/movie_trailer.dart';


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
    final result= await remoteDataSouces.getMovies();
    

    return Right(result.toEntityList());

  } on ServerException catch (e){
    return Left(ServerFailure('$e'));
    
  }on SocketException {
    return const Left(ConnectionFailure('Failed to coonect to internet'));
  }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(String movieId) async{
      try {
    final result= await remoteDataSouces.getMovieDetails(movieId);
    

    return Right(result.toEntity());

  } on ServerException catch (e){
    return Left(ServerFailure('$e'));
    
  }on SocketException {
    return const Left(ConnectionFailure('Failed to coonect to internet'));
  }

  }
  
  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String keyword) async {
     try {
    final result= await remoteDataSouces.searchMovies(keyword);
    

    return Right(result.toEntityList());

  } on ServerException catch (e){
    return Left(ServerFailure('$e'));
    
  }on SocketException {
    return const Left(ConnectionFailure('Failed to coonect to internet'));
  }
  }

  @override
  Future<Either<Failure, List<MovieTrailer>>> getMovieTraler(String keyword) async{
     try {
    final result= await remoteDataSouces.getMovieTrailers(keyword);
    

    return Right(result.toEntity());

  } on ServerException catch (e){
    return Left(ServerFailure('$e'));
    
  }on SocketException {
    return const Left(ConnectionFailure('Failed to coonect to internet'));
  }
  }
  


}