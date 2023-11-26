import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/data/models/movie_detail_model.dart';
import 'package:movieapp/data/models/movie_trailer_model.dart';

import '../models/movie_model.dart';

abstract class RemoteDataSouces {
  Future<MovieModelList> getMovies();
  Future<MovieDetailModel> getMovieDetails(String movieId);
  Future<MovieModelList> searchMovies(String keyword);
  Future<MovieTrailers> getMovieTrailers(String moviedId);
}
class GetMoviesRemote extends RemoteDataSouces {
  final Dio dio;

  GetMoviesRemote({required this.dio});
  var baseUrl = dotenv.env['BASE_URL'];
  var apikey = dotenv.env['API_KEY'];
  
  @override
  Future<MovieModelList> getMovies() async {

    //remove after testing
    var data={
    "dates": {
        "maximum": "2023-12-20",
        "minimum": "2023-11-29"
    },
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/xgGGinKRL8xeRkaAR9RMbtyk60y.jpg",
            "genre_ids": [
                16,
                10751,
                10402,
                14,
                35
            ],
            "id": 901362,
            "original_language": "en",
            "original_title": "Trolls Band Together",
            "overview": "When Branch’s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains, Branch and Poppy embark on a harrowing and emotional journey to reunite the other brothers and rescue Floyd from a fate even worse than pop-culture obscurity.",
            "popularity": 2508.728,
            "poster_path": "/bkpPTZUdq31UGDovmszsg2CchiI.jpg",
            "release_date": "2023-10-12",
            "title": "Trolls Band Together",
            "video": false,
            "vote_average": 7.268,
            "vote_count": 138
        },
        {
            "adult": false,
            "backdrop_path": "/f1AQhx6ZfGhPZFTVKgxG91PhEYc.jpg",
            "genre_ids": [
                18,
                36,
                10752
            ],
            "id": 753342,
            "original_language": "en",
            "original_title": "Napoleon",
            "overview": "An epic that details the checkered rise and fall of French Emperor Napoleon Bonaparte and his relentless journey to power through the prism of his addictive, volatile relationship with his wife, Josephine.",
            "popularity": 748.635,
            "poster_path": "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
            "release_date": "2023-11-22",
            "title": "Napoleon",
            "video": false,
            "vote_average": 6.398,
            "vote_count": 206
        },
        {
            "adult": false,
            "backdrop_path": "/5a4JdoFwll5DRtKMe7JLuGQ9yJm.jpg",
            "genre_ids": [
                28,
                12,
                878
            ],
            "id": 695721,
            "original_language": "en",
            "original_title": "The Hunger Games: The Ballad of Songbirds & Snakes",
            "overview": "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.",
            "popularity": 595.362,
            "poster_path": "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
            "release_date": "2023-11-15",
            "title": "The Hunger Games: The Ballad of Songbirds & Snakes",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 395
        },
        {
            "adult": false,
            "backdrop_path": "/dZbLqRjjiiNCpTYzhzL2NMvz4J0.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 951491,
            "original_language": "en",
            "original_title": "Saw X",
            "overview": "Between the events of 'Saw' and 'Saw II', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps.",
            "popularity": 509.974,
            "poster_path": "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg",
            "release_date": "2023-09-26",
            "title": "Saw X",
            "video": false,
            "vote_average": 7.412,
            "vote_count": 1148
        },
        {
            "adult": false,
            "backdrop_path": "/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg",
            "genre_ids": [
                28,
                53,
                80
            ],
            "id": 762430,
            "original_language": "en",
            "original_title": "Retribution",
            "overview": "When a mysterious caller puts a bomb under his car seat, Matt Turner begins a high-speed chase across the city to complete a specific series of tasks- all with his kids trapped in the back seat.",
            "popularity": 426.745,
            "poster_path": "/oUmmY7QWWn7OhKlcPOnirHJpP1F.jpg",
            "release_date": "2023-08-23",
            "title": "Retribution",
            "video": false,
            "vote_average": 6.987,
            "vote_count": 685
        },
        {
            "adult": false,
            "backdrop_path": "/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",
            "genre_ids": [
                16,
                10751,
                28,
                878,
                35
            ],
            "id": 893723,
            "original_language": "en",
            "original_title": "PAW Patrol: The Mighty Movie",
            "overview": "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.",
            "popularity": 433.682,
            "poster_path": "/aTvePCU7exLepwg5hWySjwxojQK.jpg",
            "release_date": "2023-09-21",
            "title": "PAW Patrol: The Mighty Movie",
            "video": false,
            "vote_average": 6.927,
            "vote_count": 179
        },
        {
            "adult": false,
            "backdrop_path": "/ehumsuIBbgAe1hg343oszCLrAfI.jpg",
            "genre_ids": [
                16,
                10751,
                14,
                12
            ],
            "id": 1022796,
            "original_language": "en",
            "original_title": "Wish",
            "overview": "Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force – a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe - the ruler of Rosas, King Magnifico - to save her community and prove that when the will of one courageous human connects with the magic of the stars, wondrous things can happen.",
            "popularity": 402.462,
            "poster_path": "/8QtDhh8mnGUEyrJsaeb3kYgDRaA.jpg",
            "release_date": "2023-11-13",
            "title": "Wish",
            "video": false,
            "vote_average": 6.838,
            "vote_count": 37
        },
        {
            "adult": false,
            "backdrop_path": "/azD31DjpV3PJfjF3h72LVw2WCSD.jpg",
            "genre_ids": [
                27
            ],
            "id": 807172,
            "original_language": "en",
            "original_title": "The Exorcist: Believer",
            "overview": "When two girls disappear into the woods and return three days later with no memory of what happened to them, the father of one girl seeks out Chris MacNeil, who's been forever altered by what happened to her daughter fifty years ago.",
            "popularity": 376.108,
            "poster_path": "/fFXkAlMH2iQrNknv4eq7LGTkcti.jpg",
            "release_date": "2023-10-04",
            "title": "The Exorcist: Believer",
            "video": false,
            "vote_average": 6.173,
            "vote_count": 600
        },
        {
            "adult": false,
            "backdrop_path": "/bckxSN9ueOgm0gJpVJmPQrecWul.jpg",
            "genre_ids": [
                28,
                12,
                14
            ],
            "id": 572802,
            "original_language": "en",
            "original_title": "Aquaman and the Lost Kingdom",
            "overview": "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.",
            "popularity": 217.684,
            "poster_path": "/8xV47NDrjdZDpkVcCFqkdHa3T0C.jpg",
            "release_date": "2023-12-20",
            "title": "Aquaman and the Lost Kingdom",
            "video": false,
            "vote_average": 0.0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/mPayGWnbFwlqtE65HjqNDfFGb8I.jpg",
            "genre_ids": [
                80,
                18,
                36
            ],
            "id": 466420,
            "original_language": "en",
            "original_title": "Killers of the Flower Moon",
            "overview": "When oil is discovered in 1920s Oklahoma under Osage Nation land, the Osage people are murdered one by one—until the FBI steps in to unravel the mystery.",
            "popularity": 198.908,
            "poster_path": "/dB6Krk806zeqd0YNp2ngQ9zXteH.jpg",
            "release_date": "2023-10-18",
            "title": "Killers of the Flower Moon",
            "video": false,
            "vote_average": 7.692,
            "vote_count": 1005
        },
        {
            "adult": false,
            "backdrop_path": "/iEFuHjqrE059SmflBva1JzDJutE.jpg",
            "genre_ids": [
                16,
                10751,
                14,
                28,
                10749
            ],
            "id": 496450,
            "original_language": "fr",
            "original_title": "Miraculous - le film",
            "overview": "A life of an ordinary Parisian teenager Marinette goes superhuman when she becomes Ladybug. Bestowed with magical powers of creation, Ladybug must unite with her opposite, Cat Noir, to save Paris as a new villain unleashes chaos unto the city.",
            "popularity": 204.454,
            "poster_path": "/dQNJ8SdCMn3zWwHzzQD2xrphR1X.jpg",
            "release_date": "2023-07-05",
            "title": "Miraculous: Ladybug & Cat Noir, The Movie",
            "video": false,
            "vote_average": 7.8,
            "vote_count": 663
        },
        {
            "adult": false,
            "backdrop_path": "/igwshQHV36aBkPyWp7En5P4Kn2V.jpg",
            "genre_ids": [
                27,
                53,
                9648
            ],
            "id": 1071215,
            "original_language": "en",
            "original_title": "Thanksgiving",
            "overview": "After a Black Friday riot ends in tragedy, a mysterious Thanksgiving-inspired killer terrorizes Plymouth, Massachusetts - the birthplace of the holiday. Picking off residents one by one, what begins as random revenge killings are soon revealed to be part of a larger, sinister holiday plan.",
            "popularity": 166.63,
            "poster_path": "/lhmdKoZciQsD6pOxIi0ZkXudISw.jpg",
            "release_date": "2023-11-16",
            "title": "Thanksgiving",
            "video": false,
            "vote_average": 6.158,
            "vote_count": 57
        },
        {
            "adult": false,
            "backdrop_path": "/pIbsQ4Cu8rGWkj8QjD6Sqy9NzAS.jpg",
            "genre_ids": [
                35,
                12
            ],
            "id": 1002315,
            "original_language": "en",
            "original_title": "Please Don't Destroy: The Treasure of Foggy Mountain",
            "overview": "When three friends who live together realize that they don't like their life trajectory, they set off to find a gold treasure that is rumored to be buried in the nearby mountain.",
            "popularity": 134.475,
            "poster_path": "/2WSTjQNamyMoy3kFDemd1os8TNz.jpg",
            "release_date": "2023-11-17",
            "title": "Please Don't Destroy: The Treasure of Foggy Mountain",
            "video": false,
            "vote_average": 6.095,
            "vote_count": 21
        },
        {
            "adult": false,
            "backdrop_path": "/yOm993lsJyPmBodlYjgpPwBjXP9.jpg",
            "genre_ids": [
                35,
                10751,
                14
            ],
            "id": 787699,
            "original_language": "en",
            "original_title": "Wonka",
            "overview": "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
            "popularity": 117.492,
            "poster_path": "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
            "release_date": "2023-12-06",
            "title": "Wonka",
            "video": false,
            "vote_average": 0.0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/f9ErVXAyR9EP5WOOp4i5ivBKsKC.jpg",
            "genre_ids": [
                35
            ],
            "id": 814776,
            "original_language": "en",
            "original_title": "Bottoms",
            "overview": "Unpopular best friends PJ and Josie start a high school self-defense club to meet girls and lose their virginity. They soon find themselves in over their heads when the most popular students start beating each other up in the name of self-defense.",
            "popularity": 142.549,
            "poster_path": "/jeyTQrNEpyE1LZIgVlswYh3sc34.jpg",
            "release_date": "2023-08-25",
            "title": "Bottoms",
            "video": false,
            "vote_average": 6.922,
            "vote_count": 206
        },
        {
            "adult": false,
            "backdrop_path": "/1HzL603WOer58xtnrRYdSIL5K04.jpg",
            "genre_ids": [
                35,
                12
            ],
            "id": 912908,
            "original_language": "en",
            "original_title": "Strays",
            "overview": "When Reggie is abandoned on the mean city streets by his lowlife owner, Doug, Reggie is certain that his beloved owner would never leave him on purpose. But once Reggie falls in with Bug, a fast-talking, foul-mouthed stray who loves his freedom and believes that owners are for suckers, Reggie finally realizes he was in a toxic relationship and begins to see Doug for the heartless sleazeball that he is.",
            "popularity": 140.092,
            "poster_path": "/muDaKftykz9Nj1mhRheMdbuNI9Z.jpg",
            "release_date": "2023-08-17",
            "title": "Strays",
            "video": false,
            "vote_average": 7.546,
            "vote_count": 526
        },
        {
            "adult": false,
            "backdrop_path": "/8KJMOKyl9rpgb9ELEwhfBMIaTHw.jpg",
            "genre_ids": [
                10751,
                16,
                14,
                35
            ],
            "id": 1139087,
            "original_language": "en",
            "original_title": "Once Upon a Studio",
            "overview": "Created for Disney's 100th anniversary, the short features Mickey Mouse corralling a gallery of legendary Disney characters for a group photo.",
            "popularity": 116.961,
            "poster_path": "/hr8ZtwdbtjBquxlTCrczr685K5T.jpg",
            "release_date": "2023-09-24",
            "title": "Once Upon a Studio",
            "video": false,
            "vote_average": 8.417,
            "vote_count": 241
        },
        {
            "adult": false,
            "backdrop_path": "/5d1sQtAKsbVjdUuzXWoh2vKtyy7.jpg",
            "genre_ids": [
                28,
                18,
                35
            ],
            "id": 897160,
            "original_language": "ko",
            "original_title": "용감한 시민",
            "overview": "An expelled boxing champion, who now is a high-school teacher, witnesses intolerable violence and throws her first punch to build justice against it, while putting on a mask.",
            "popularity": 71.926,
            "poster_path": "/6Ea5i6APeTfm4hHh6dg5Z733JVS.jpg",
            "release_date": "2023-10-25",
            "title": "Brave Citizen",
            "video": false,
            "vote_average": 5.0,
            "vote_count": 1
        },
        {
            "adult": false,
            "backdrop_path": "/rron9HAuS9s7zBF8iCX1tsafxUo.jpg",
            "genre_ids": [
                18,
                10749
            ],
            "id": 666277,
            "original_language": "en",
            "original_title": "Past Lives",
            "overview": "Nora and Hae Sung, two childhood friends, are reunited in New York for one fateful week as they confront notions of destiny, love, and the choices that make a life.",
            "popularity": 98.55,
            "poster_path": "/k3waqVXSnvCZWfJYNtdamTgTtTA.jpg",
            "release_date": "2023-06-02",
            "title": "Past Lives",
            "video": false,
            "vote_average": 7.92,
            "vote_count": 299
        },
        {
            "adult": false,
            "backdrop_path": "/a0GM57AnJtNi7lMOCamniiyV10W.jpg",
            "genre_ids": [
                16,
                12,
                14,
                18
            ],
            "id": 508883,
            "original_language": "ja",
            "original_title": "君たちはどう生きるか",
            "overview": "While the Second World War rages, the teenage Mahito, haunted by his mother's tragic death, is relocated from Tokyo to the serene rural home of his new stepmother Natsuko, a woman who bears a striking resemblance to the boy's mother. As he tries to adjust, this strange new world grows even stranger following the appearance of a persistent gray heron, who perplexes and bedevils Mahito, dubbing him the \"long-awaited one.\"",
            "popularity": 87.675,
            "poster_path": "/jDQPkgzerGophKRRn7MKm071vCU.jpg",
            "release_date": "2023-07-14",
            "title": "The Boy and the Heron",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 192
        }
    ],
    "total_pages": 29,
    "total_results": 563
};


    try {
     final result = await dio.get('$baseUrl/upcoming?api_key=$apikey');
     print(result.data);
//edit here after data changed
      final movie = MovieModelList.fromJson(
        result.data
      );

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<MovieDetailModel> getMovieDetails(String movieId) async{
   try {
      final result = await dio.get('$baseUrl/$movieId?api_key=$apikey');
      print(result.data);

      var data={
    "adult": false,
    "backdrop_path": "/xgGGinKRL8xeRkaAR9RMbtyk60y.jpg",
    "belongs_to_collection": {
        "id": 489724,
        "name": "The Trolls Collection",
        "poster_path": "/i4aII37O184x7K3dC7fpF9CAfS4.jpg",
        "backdrop_path": "/xtgonS6wcxK5RfnWWohYZF3mhjM.jpg"
    },
    "budget": 95000000,
    "genres": [
        {
            "id": 16,
            "name": "Animation"
        },
        {
            "id": 10751,
            "name": "Family"
        },
        {
            "id": 10402,
            "name": "Music"
        },
        {
            "id": 14,
            "name": "Fantasy"
        },
        {
            "id": 35,
            "name": "Comedy"
        }
    ],
    "homepage": "https://www.dreamworks.com/movies/trolls-band-together",
    "id": 901362,
    "imdb_id": "tt14362112",
    "original_language": "en",
    "original_title": "Trolls Band Together",
    "overview": "When Branch’s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains, Branch and Poppy embark on a harrowing and emotional journey to reunite the other brothers and rescue Floyd from a fate even worse than pop-culture obscurity.",
    "popularity": 2274.279,
    "poster_path": "/bkpPTZUdq31UGDovmszsg2CchiI.jpg",
    "production_companies": [
        {
            "id": 521,
            "logo_path": "/kP7t6RwGz2AvvTkvnI1uteEwHet.png",
            "name": "DreamWorks Animation",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2023-10-12",
    "revenue": 107900000,
    "runtime": 92,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "There are some new trolls on the block.",
    "title": "Trolls Band Together",
    "video": false,
    "vote_average": 7.332,
    "vote_count": 125
};

      final movie = MovieDetailModel.fromJson(
        result.data
        );

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<MovieModelList> searchMovies(String keyword) async {
    try {
      final result = await dio.get('https://api.themoviedb.org/3/search/movie?query=$keyword&include_adult=false&language=en-US&page=1&api_key=$apikey');
      print(result.data);

      final movie = MovieModelList.fromJson(result.data);

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  @override
  Future<MovieTrailers> getMovieTrailers(String moviedId) async {
    var data={
    "id": 753342,
    "results": [
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Final Trailer",
            "key": "1DJYiG6wh0w",
            "site": "YouTube",
            "size": 1080,
            "type": "Trailer",
            "official": true,
            "published_at": "2023-11-20T15:30:00.000Z",
            "id": "655b8084ea84c71096e00679"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Premiere Sizzle",
            "key": "KsC2TD_IuCg",
            "site": "YouTube",
            "size": 1080,
            "type": "Featurette",
            "official": true,
            "published_at": "2023-11-17T18:07:41.000Z",
            "id": "6557b2ea7f054018d515f861"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Premiere Timelapse",
            "key": "aBKcJE1yTp8",
            "site": "YouTube",
            "size": 1080,
            "type": "Featurette",
            "official": true,
            "published_at": "2023-11-17T18:07:09.000Z",
            "id": "6557b2f8b5400214d06f11d6"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Behind the Scenes With Ridley Scott",
            "key": "jWfRDil69sg",
            "site": "YouTube",
            "size": 1080,
            "type": "Featurette",
            "official": true,
            "published_at": "2023-11-11T17:00:38.000Z",
            "id": "6552c2a267b61345cf040866"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Film Clip",
            "key": "X45DbrvWCyc",
            "site": "YouTube",
            "size": 1080,
            "type": "Clip",
            "official": true,
            "published_at": "2023-11-10T17:00:33.000Z",
            "id": "6552c28567b61345cb4c8116"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Vanessa Kirby is Josephine",
            "key": "GFxZN5rteXk",
            "site": "YouTube",
            "size": 1080,
            "type": "Featurette",
            "official": true,
            "published_at": "2023-10-19T15:59:03.000Z",
            "id": "65315848c439c00138364342"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Official Trailer #2",
            "key": "LIsfMO5Jd_w",
            "site": "YouTube",
            "size": 1080,
            "type": "Trailer",
            "official": true,
            "published_at": "2023-10-18T12:59:40.000Z",
            "id": "6530aac451a64e00e9d0ae49"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Vignette - Ridley Scott: Real Filmmaking",
            "key": "37EySlTiO4I",
            "site": "YouTube",
            "size": 1080,
            "type": "Featurette",
            "official": true,
            "published_at": "2023-10-03T14:59:00.000Z",
            "id": "651c2c67223a8b01206d2cb2"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "\"Unique Genius\" Vignette",
            "key": "t-GzKyT3xO8",
            "site": "YouTube",
            "size": 1080,
            "type": "Featurette",
            "official": true,
            "published_at": "2023-10-02T13:44:18.000Z",
            "id": "651acd5f967cc73427f1c61f"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Official Trailer",
            "key": "CBmWztLPp9c",
            "site": "YouTube",
            "size": 1080,
            "type": "Trailer",
            "official": true,
            "published_at": "2023-07-10T11:59:53.000Z",
            "id": "64abf3e88a0e9b0100c3b3ff"
        }
    ]
};
    try {
      final result = await dio.get('$baseUrl/$moviedId/videos?language=en-US&api_key=$apikey');
      print(result.data);

      final movie = MovieTrailers.fromJson(
       result.data
        );

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
