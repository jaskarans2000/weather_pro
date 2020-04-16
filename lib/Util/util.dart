import 'package:intl/intl.dart';

class Util{
  static String appID="appId";

  static String getFormattedDate(DateTime dateTime){
    return DateFormat("EEEE,d,MMMM,y").format(dateTime);
  }
}
