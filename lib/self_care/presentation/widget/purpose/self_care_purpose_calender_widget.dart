import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_calender_provider.dart';

class SelfCarePurposeCalenderWidget extends ConsumerStatefulWidget {
  final LayerLink link;
  final DateTime selectedDate;
  final SelfCarePurposeCalenderStateNotifier notifier;

  const SelfCarePurposeCalenderWidget({
    super.key,
    required this.link,
    required this.notifier,
    required this.selectedDate,
  });

  @override
  ConsumerState<SelfCarePurposeCalenderWidget> createState() =>
      _SelfCarePurposeCalenderWidgetState();
}

class _SelfCarePurposeCalenderWidgetState
    extends ConsumerState<SelfCarePurposeCalenderWidget> {
  final PageController _pageController =
      PageController(initialPage: DateTime.now().month - 1);

  // 정확히는 선택한 년도, DateTime.now()는 기본값
  DateTime _currentDateTime = DateTime.now();

  Widget _buildWeekDay(String day) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: PtdTextWidget.bodySmall(day, MaeumgagymColor.gray300),
    );
  }

  Widget buildCalendar(DateTime pageDate) {
    // 내가 선택한 페이지의 일 수가 나옴
    // month + 1을 한 것은 day를 0으로 설정했을때 전월의 마지막 일을 출력하기 때문
    int daysInMonth = DateTime(pageDate.year, pageDate.month + 1, 0).day;
    DateTime firstDayOfMonth = DateTime(pageDate.year, pageDate.month, 1);

    // 그 월에 시작하는 요일이 무슨 요일인지 알아냄
    int weekdayOfFirstDay = firstDayOfMonth.weekday;

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 13,
        mainAxisSpacing: 6,
      ),
      itemCount: daysInMonth + weekdayOfFirstDay,
      itemBuilder: (context, index) {
        if (index < weekdayOfFirstDay) {
          return const SizedBox();
        } else {
          DateTime date = DateTime(
            pageDate.year,
            pageDate.month,
            index - weekdayOfFirstDay + 1,
          );
          String dayText = date.day.toString();
          bool isSelectDay = date == widget.selectedDate;
          bool isToday = date ==
              DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
              );

          return GestureDetector(
            onTap: () {
              widget.notifier.saveDate(date: date);
              widget.notifier.overlayRemove();
            },
            child: Builder(
              builder: (context) {
                if (isSelectDay) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MaeumgagymColor.blue50,
                    ),
                    child: Center(
                      child: PtdTextWidget.bodyLarge(
                        dayText,
                        MaeumgagymColor.blue600,
                      ),
                    ),
                  );
                } else if (isToday) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MaeumgagymColor.blue500,
                    ),
                    child: Center(
                      child: PtdTextWidget.bodyLarge(
                        dayText,
                        MaeumgagymColor.white,
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: PtdTextWidget.bodyLarge(
                        dayText,
                        MaeumgagymColor.black,
                      ),
                    ),
                  );
                }
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: CompositedTransformFollower(
          link: widget.link,
          offset: const Offset(0, 96),
          child: Material(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              width: MediaQuery.of(context).size.width - 40,
              height: 348,
              decoration: BoxDecoration(
                color: MaeumgagymColor.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 60,
                    offset: Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                children: [
                  /// 년, 월 표시와 화살표로 월 이동
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 현재 month
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PtdTextWidget.titleSmall(
                              '${_currentDateTime.year}년 ${_currentDateTime.month}월',
                              MaeumgagymColor.black,
                            ),
                            const SizedBox(width: 8),
                            ImageWidget(
                              image: Images.chevronRight,
                              height: 24,
                              color: MaeumgagymColor.blue500,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_currentDateTime.month != 1) {
                                    // page 뒤로가기
                                    _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  } else {
                                    _currentDateTime = DateTime(
                                      _currentDateTime.year - 1,
                                      _currentDateTime.month,
                                      _currentDateTime.day,
                                    );
                                    _pageController.jumpToPage(11);
                                  }
                                },
                                child: ImageWidget(
                                  image: Images.chevronLeft,
                                  imageHeight: 25,
                                  color: MaeumgagymColor.blue500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_currentDateTime.month != 12) {
                                    setState(() {
                                      _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    });
                                  } else {
                                    _currentDateTime = DateTime(
                                      _currentDateTime.year + 1,
                                      _currentDateTime.month,
                                      _currentDateTime.day,
                                    );
                                    _pageController.jumpToPage(0);
                                  }
                                },
                                child: ImageWidget(
                                  image: Images.chevronRight,
                                  imageHeight: 25,
                                  color: MaeumgagymColor.blue500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  /// 요일들 나열
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildWeekDay('Sun'),
                        _buildWeekDay('Mon'),
                        _buildWeekDay('Tue'),
                        _buildWeekDay('Wed'),
                        _buildWeekDay('Thu'),
                        _buildWeekDay('Fri'),
                        _buildWeekDay('Sat'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (month) {
                        setState(() {
                          _currentDateTime =
                              DateTime(_currentDateTime.year, month + 1, 1);
                        });
                      },
                      itemCount: 12,
                      itemBuilder: (context, pageIndex) {
                        return buildCalendar(
                          DateTime(_currentDateTime.year, pageIndex + 1, 1),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
