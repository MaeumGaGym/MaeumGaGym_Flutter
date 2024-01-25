import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_edit_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/container/self_care_my_routine_detail_title_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_detail_dialog.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_detail_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareMyRoutineDetailScreen extends StatelessWidget {
  final int index;

  const SelfCareMyRoutineDetailScreen({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 루틴 아이템을 식별하기 위한 index
                SelfCareMyRoutineDetailTitleContainer(index: index),
                const SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SelfCareMyRoutineDetailRoutineItemWidget(),

                        /// 마지막 아이템일 경우 간격 x
                        SizedBox(height: index == 50 - 1 ? 0 : 12),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 98),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,

          /// 디자인보면 위쪽에 색있음
          border: Border(
            top: BorderSide(
              color: MaeumgagymColor.gray50,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: SelfCareMyRoutineButton(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    title: "루틴 삭제",
                    imagePath:
                        "assets/image/self_care_icon/edit_trash_icon.svg",
                    buttonColor: MaeumgagymColor.gray50,
                    textColor: MaeumgagymColor.gray800,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>

                            /// 루틴 수정 페이지로 이동
                            const SelfCareMyRoutineEditScreen(),
                      ),
                    ),
                    child: SelfCareMyRoutineButton(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      title: "루틴 수정",
                      imagePath:
                          "assets/image/self_care_icon/edit_pencil_icon.svg",
                      imageColor: MaeumgagymColor.white,
                      buttonColor: MaeumgagymColor.blue500,
                      textColor: MaeumgagymColor.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return SelfCareMyRoutineDetailDialog(index: index);
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/image/core_icon/dots_vertical_icon.svg",
                    width: 32,
                    height: 32,
                    color: MaeumgagymColor.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
