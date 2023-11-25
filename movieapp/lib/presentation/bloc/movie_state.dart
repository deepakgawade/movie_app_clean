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
