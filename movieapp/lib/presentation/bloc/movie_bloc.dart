import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_detail.dart';
import 'package:movieapp/domain/entities/movie_trailer.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_movie_trailer.dart';
import 'package:movieapp/domain/usecases/search_movie.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_movie_list.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieList getMovieList;
  final GetMovieDetail getMovieDetail;
  final SearchMovie searchMovie;
  final GetMovieTrailer getMovieTrailer;
  // final MovieRepository movieRepository;
  MoviesBloc(this.getMovieList, this.getMovieDetail,this.searchMovie,this.getMovieTrailer)
      : super(MoviesInitialState()) {
    on<MovieDetailEvent>(getMovieInfo);
    on<MoviesUpcomingEvent>(upcominMovies);
    on<MoviesResetEvent>(reset);
    on<MovieSearchResetEvent>(resetSearch);
    on<MovieSearchEvent>(searchMovies);
  }

  void getMovieInfo(MovieDetailEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesDetailsLoadingState());
    final result = await getMovieDetail.execute(event.movieId);
   final trailersResult=await  getMovieTrailer.execute(event.movieId);

    if (result.isRight()) {
      emit(MoviesDeatilsLoadedState(trailers: trailersResult.getOrElse(() => <MovieTrailer>[]),
          movie: result.getOrElse(() => const MovieDetail(
              title: "",
              id: 0,
              poster: "",
              releaseDate: "",
              genres: [],
              overview: ""))));
    } else {
      emit(MoviesDetailsFailureState());
    }
  }

  void reset(MoviesResetEvent event, Emitter<MoviesState> emit) {
    emit(MoviesInitialState());
  }

    void resetSearch(MovieSearchResetEvent event, Emitter<MoviesState> emit) {
    emit(MoviesInitialState());
  }

  void upcominMovies(
      MoviesUpcomingEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoadingState());
    final result = await getMovieList.execute();

    if (result.isRight()) {
      emit(MoviesLoadedState(movies: result.getOrElse(() => <Movie>[])));
    } else {
      emit(MoviesFailureState());
    }
  }

    void searchMovies(
      MovieSearchEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesSearchLoadingState());
    final result = await searchMovie.execute(event.keyword);

    if (result.isRight()) {
      emit(MoviesSearchLoadedState(movies: result.getOrElse(() => <Movie>[])));
    } else {
      emit(MoviesSearchFailureState());
    }
  }

//   void reset(CountryResetEvent event, Emitter<CountryState> emit){
// emit(CountryInitialState());
//   }
}
