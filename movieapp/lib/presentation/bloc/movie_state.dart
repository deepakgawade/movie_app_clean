part of 'movie_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();
  
  @override
  List<Object> get props => [];
}


//these states are for movies list
final class MoviesInitialState extends MoviesState {}
final class MoviesLoadedState extends MoviesState {
  final List<Movie> movies;

 const MoviesLoadedState({required this.movies});

}
final class MoviesFailureState extends MoviesState {}
final class MoviesLoadingState extends MoviesState {}

//this are the states for movie details
final class MoviesDeatilsLoadedState extends MoviesState {
  final MovieDetail movie;
  final List<MovieTrailer> trailers;

 const MoviesDeatilsLoadedState({required this.movie, required this.trailers});

}
final class MoviesDetailsFailureState extends MoviesState {}
final class MoviesDetailsLoadingState extends MoviesState {}

//states for movie search
//these states are for movies list
final class MoviesSearchInitialState extends MoviesState {}
final class MoviesSearchLoadedState extends MoviesState {
  final List<Movie> movies;

 const MoviesSearchLoadedState({required this.movies});

}
final class MoviesSearchFailureState extends MoviesState {}
final class MoviesSearchLoadingState extends MoviesState {}