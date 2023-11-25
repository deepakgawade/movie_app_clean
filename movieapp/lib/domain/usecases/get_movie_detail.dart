import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/movie_detail.dart';
import '../../data/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetail{
  final MovieRepository movieRepository;

  GetMovieDetail({required this.movieRepository});


  Future<Either<Failure,MovieDetail>> execute(String movieId){
    return movieRepository.getMovieDetail(movieId);
  }


}