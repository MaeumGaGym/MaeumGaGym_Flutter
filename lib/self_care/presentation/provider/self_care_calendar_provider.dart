import 'package:flutter_riverpod/flutter_riverpod.dart';

final selfCareCalendarProvider = StateProvider((ref) => SelfCareCalendarNotifier());

class SelfCareCalendarNotifier extends StateNotifier {
  List<String> week = ["일", "월", "화", "수", "목", "금", "토"];
  DateTime now = DateTime.now();
  int weeks = 5;
  List<Map<String, dynamic>> days = [];

  SelfCareCalendarNotifier() : super([]);

  void insertDays() {
    /// 리스트 초기화
    days.clear();

    int year = now.year;
    int month = now.month;

    /// 해당 달의 주수 구하기
    DateTime firstDay = DateTime(year, month, 1);
    DateTime lastDay = DateTime(year, month + 1, 0);
    int dayDifference = lastDay.difference(firstDay).inDays;
    weeks = ((dayDifference + firstDay.weekday - 1) / 7).ceil();

    /// 이번 달의 날짜 구하기
    for (var i = 1; i <= lastDay.day; i++) {
      days.add({
        "year": year,
        "month": month,
        "day": i,
        "inMonth": true,
        "picked": false,
      });
    }

    /// 이전 달의 날짜 구하기
    if (firstDay.weekday != 7) {
      /// temp 안에 여러가지 타입이 들어가기 때문에 var로 리스트 선언
      var temp = [];
      int prevLastDay = DateTime(year, month, 0).day;
      for (int i = firstDay.weekday - 1; i >= 0; i--) {
        temp.add({
          "year": year,
          "month": month - 1,
          "day": prevLastDay - i,
          "inMonth": false,
          "picked": false,
        });
      }
      /// temp를 days앞에 배치
      days = [...temp, ...days];
    }

    /// 이후 달의 날짜 구하기
    var temp = [];
    for (var i = 1; i <= weeks * 7 - days.length; i++) {
      temp.add({
        "year": year,
        "month": month + 1,
        "day": i,
        "inMonth": false,
        "picked": false,
      });
    }

    days = [...days, ...temp];
  }
}
