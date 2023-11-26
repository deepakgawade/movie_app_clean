

import 'package:intl/intl.dart';

String getDateFormate(String text){
  var parsedDate=DateTime.parse(text);

   final DateFormat formatter = DateFormat('MMMM dd, y');
  final String formatted = formatter.format(parsedDate);
  return formatted;
}