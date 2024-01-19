import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_item_count_widget.dart';

class SelfCareMyRoutinePoseItemWidget extends StatefulWidget {
  // final String title; // 나중에 기능 추가
  // final String imagePath;

  const SelfCareMyRoutinePoseItemWidget({
    Key? key,
    // required this.title,
    // required this.imagePath,
  }) : super(key: key);

  @override
  State<SelfCareMyRoutinePoseItemWidget> createState() =>
      _SelfCareMyRoutinePoseItemWidgetState();
}

class _SelfCareMyRoutinePoseItemWidgetState
    extends State<SelfCareMyRoutinePoseItemWidget> {
  late TextEditingController countController;
  late TextEditingController setController;

  @override
  void initState() {
    super.initState();
    /// 기본값은 1
    countController = TextEditingController(text: "1");
    setController = TextEditingController(text: "1");
  }

  @override
  void dispose() {
    countController.dispose();
    setController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                /// 아이템 사진
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.gray25,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(width: 18),
                /// 아이템 이름
                PtdTextWidget.bodyLarge(
                  "푸시업",
                  MaeumgagymColor.black,
                ),
              ],
            ),
            GestureDetector(
              child: SvgPicture.asset(
                "assets/image/self_care_icon/close_icon.svg",
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SelfCareMyRoutineItemCountWidget(
          title: "횟수",
          controller: countController,
        ),
        const SizedBox(height: 12),
        SelfCareMyRoutineItemCountWidget(
          title: "세트",
          controller: setController,
        ),
      ],
    );
  }
}
