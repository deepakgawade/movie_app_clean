import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_list.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieList  getMovieList;
 // final MovieRepository movieRepository;
  MoviesBloc(this.getMovieList) : super(MoviesInitialState()) {
    //on<MoviesSearchEvent>(getCountryInfo);
    on<MoviesUpcomingEvent>(upcominMovies);
  }

//   void getCountryInfo(CountrySearchEvent event,Emitter<CountryState> emit)async{
// emit(CountryLoadingState());
//   final result= await countryRepository.execute(event.country);

// if(result.isRight()){
//   emit(CountryLoadedState(county: result.getOrElse(() => const Country(name: "India", common: "India", currencies: "Rupees", capital: "Delhi", capitalLocation: "", countryLocation: "", borders: const [" "], area: 23445.455, population: 0, flags: const[""], coatOfArms: ""))));
// }else{
//   emit(CountryFailureState());
// }

// }

//   void reset(CountryResetEvent event, Emitter<CountryState> emit){
// emit(CountryInitialState());
//   }

    void upcominMovies(MoviesUpcomingEvent event,Emitter<MoviesState> emit)async{
emit(MoviesLoadingState());
  final result= await getMovieList.execute();

if(result.isRight()){
  emit(MoviesLoadedState(movies: result.getOrElse(() => <Movie>[])));
}else{
  emit(MoviesFailureState());
}

}

//   void reset(CountryResetEvent event, Emitter<CountryState> emit){
// emit(CountryInitialState());
//   }
}






