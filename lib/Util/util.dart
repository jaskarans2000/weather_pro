import 'package:intl/intl.dart';

class Util{
  static String appID="98f220ca3dc1181dc396e31d1d74573a";

  static String getFormattedDate(DateTime dateTime){
    return DateFormat("EEEE,d,MMMM,y").format(dateTime);
  }
}