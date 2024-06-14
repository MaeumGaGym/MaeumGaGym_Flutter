import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_calendar_provider.dart';

class SelfCareCalendarWidget extends ConsumerStatefulWidget {
  const SelfCareCalendarWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareCalendarWidget> createState() =>
      _SelfCareCalendarContainerState();
}

class _SelfCareCalendarContainerState
    extends ConsumerState<SelfCareCalendarWidget> {
  final DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    ref.read(selfCareCalendarProvider).insertDays();
  }

  @override
  Widget build(BuildContext context) {
    final calendarState = ref.watch(selfCareCalendarProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                for (int i = 0; i < calendarState.week.length; i++)
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PtdTextWidget.bodyMedium(
                          calendarState.week[i],
                          MaeumgagymColor.gray600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          /// 타임라인에 일정은 추후에 api 연동하면서 구현해볼게요..
          Column(
            children: [
              for (int i = 0, index = 0; i < calendarState.weeks; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int j = 0; j < 7; j++, index++)
                      Expanded(
                        child: Container(
                          height: 82,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                width: 24,
                                height: 24,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  /// 날짜가 이번 달 안에 있으면서, 날짜가 오늘 날짜와 같으면 >> blue500
                                  color: calendarState.days[index]["inMonth"] && calendarState.days[index]["day"] == _now.day
                                      ? MaeumgagymColor.blue500
                                      : null,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: PtdTextWidget.bodyMedium(
                                  calendarState.days[index]["day"].toString(),
                                  /// 날짜가 이번 달 안에 있으면서, 날짜가 오늘 날짜와 같으면 >> white
                                  calendarState.days[index]["inMonth"] && calendarState.days[index]["day"] == _now.day
                                      ? MaeumgagymColor.white
                                  /// 날짜가 이번 달 안에만 있으면 >> gray600
                                      : calendarState.days[index]["inMonth"]
                                          ? MaeumgagymColor.gray600
                                  /// 날짜가 이번 달 안에 없으면 >> gray200
                                          : MaeumgagymColor.gray200,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}
