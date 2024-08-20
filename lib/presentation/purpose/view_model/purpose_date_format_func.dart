import 'package:intl/intl.dart';

class PurposeDateFormatFunc {
  static String formatDate(String date) {
    DateTime parsingDate = DateTime.parse(date);
    String formattedDate = DateFormat('MM월 dd일', 'ko').format(parsingDate);
    return formattedDate;
  }

  static String formatDetailDate(String date) {
    DateTime parsingDate = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy년 MM월 dd일 (E)', 'ko').format(parsingDate);
    return formattedDate;
  }

  static String formatPostDate(DateTime date){
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }
}