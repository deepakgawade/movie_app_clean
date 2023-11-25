import 'package:flutter_dotenv/flutter_dotenv.dart';

String getImageUrl(String url){

     var baseUrl= 
     'https://image.tmdb.org/t/p/w500';

     return '$baseUrl$url';

}