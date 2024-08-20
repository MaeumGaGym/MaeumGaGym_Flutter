import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class PurposeAddEditCalenderWidget extends StatefulWidget {
  final LayerLink link;
  final DateTime selectedDate;
  final Function({required DateTime date}) saveDate;
  final Function removeCalender;

  const PurposeAddEditCalenderWidget({
    super.key,
    required this.link,
    required this.selectedDate,
    required this.saveDate,
    required this.removeCalender,
  });

  @override
  State<PurposeAddEditCalenderWidget> createState() =>
      _PurposeAddEditCalenderWidgetState();
}

class _PurposeAddEditCalenderWidgetState extends State<PurposeAddEditCalenderWidget> {
  late final PageController _pageController;

  // 정확히는 선택한 년도, DateTime.now()는 기본값
  DateTime _currentDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: DateTime.now().month - 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  Widget _buildWeekDay(String day) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: MaeumText.bodySmall(day, MaeumColor.gray300),
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 13.w,
        mainAxisSpacing: 6.h,
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
              widget.saveDate(date: date);
              widget.removeCalender();
            },
            child: Builder(
              builder: (context) {
                if (isSelectDay) {
                  return Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MaeumColor.blue50,
                    ),
                    child: Center(
                      child: MaeumText.bodyLarge(
                        dayText,
                        MaeumColor.blue600,
                      ),
                    ),
                  );
                } else if (isToday) {
                  return Container(
                    width: 40.w ,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MaeumColor.blue500,
                    ),
                    child: Center(
                      child: MaeumText.bodyLarge(
                        dayText,
                        MaeumColor.white,
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: Center(
                      child: MaeumText.bodyLarge(
                        dayText,
                        MaeumColor.black,
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
    return Stack(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => widget.removeCalender(),
            child: Container(color: Colors.transparent,)
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CompositedTransformFollower(
            link: widget.link,
            offset: Offset(0, 96.h),
            child: Material(
              // 투명색
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                width: 1.sw - 40.w,
                height: 348.h,
                decoration: BoxDecoration(
                  color: MaeumColor.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x19000000),
                      blurRadius: 60.r,
                      offset: Offset(0, 10.h),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    /// 년, 월 표시와 화살표로 월 이동
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 현재 month
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MaeumText.titleSmall(
                                '${_currentDateTime.year}년 ${_currentDateTime.month}월',
                                MaeumColor.black,
                              ),
                              SizedBox(width: 8.w),
                              ImageWidget(
                                image: Images.chevronRight,
                                height: 24.h,
                                color: MaeumColor.blue500,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 60.w,
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
                                    imageHeight: 25.h,
                                    color: MaeumColor.blue500,
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
                                    imageHeight: 25.h,
                                    color: MaeumColor.blue500,
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
      ],
    );
  }
}
