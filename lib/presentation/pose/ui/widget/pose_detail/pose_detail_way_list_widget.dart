import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class PoseDetailWayListWidget extends StatelessWidget {
  final String title;
  final List<String> listData;

  const PoseDetailWayListWidget({
    required this.title,
    required this.listData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: MaeumText.titleMedium(title, MaeumColor.black),
        ),

        /// listData로 온 데이터를 ListView.builder로 만들어서 뿌려줌
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listData.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// 번호
                  SizedBox(
                    width: 52.w,
                    height: 32.h,
                    child: MaeumText.titleMedium(
                      (index + 1).toString().padLeft(2, '0'),
                      MaeumColor.gray200,
                    ),
                  ),

                  /// 콘텐츠
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 1.sw - 92.w,
                        child: MaeumText.bodyMedium(
                          listData[index],
                          MaeumColor.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
