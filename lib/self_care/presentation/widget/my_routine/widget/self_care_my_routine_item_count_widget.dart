import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_pose_list_provider.dart';

class SelfCareMyRoutineItemCountWidget extends ConsumerWidget {
  final String title;
  final TextEditingController controller;

  const SelfCareMyRoutineItemCountWidget({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  void incrementControllerValue() {
    /// controller.text를 int로 변환할 수 있다면 변환 값을 반환, 아니면 null => 0,
    int currentValue = int.tryParse(controller.text) ?? 0;
    controller.text = (currentValue + 1).toString();
  }

  void decrementControllerValue() {
    int currentValue = int.tryParse(controller.text) ?? 0;

    /// 횟수가 최솟값인 1보다 작을 수 없기 때문.
    if (currentValue > 1) {
      controller.text = (currentValue - 1).toString();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),

          /// 횟수 or 세트
          child: PtdTextWidget.bodyMedium(
            title,
            MaeumgagymColor.black,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 36,
            decoration: BoxDecoration(
              color: MaeumgagymColor.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: MaeumgagymColor.gray100,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => decrementControllerValue(),
                  child: Container(
                    width: 36,
                    decoration: BoxDecoration(
                      color: MaeumgagymColor.gray25,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                      border: Border(
                        right: BorderSide(
                          color: MaeumgagymColor.gray100,
                          width: 1,
                        ),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/image/self_care_icon/remove_minus_icon.svg",
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        int parsedValue = int.tryParse(value) ?? 0;
                        /// 1보다 작은 경우 1로 설정
                        /// -, 0이 입력 되면 1로 고정
                        if (parsedValue < 1) {
                          controller.text = '1';
                        } else {

                        }
                      }
                    },
                    textAlign: TextAlign.center,
                    cursorColor: MaeumgagymColor.blue500,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: MaeumgagymColor.black,
                      fontSize: 16,
                      fontFamily: pretendard,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.visible,
                      decorationThickness: 0,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => incrementControllerValue(),
                  child: Container(
                    width: 36,
                    decoration: BoxDecoration(
                      color: MaeumgagymColor.gray25,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      border: Border(
                        left: BorderSide(
                          color: MaeumgagymColor.gray100,
                          width: 1,
                        ),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/image/self_care_icon/add_icon.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
