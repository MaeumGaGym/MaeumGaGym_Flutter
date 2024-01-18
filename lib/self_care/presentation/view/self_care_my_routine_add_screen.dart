import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_pose_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';

class SelfCareMyRoutineAddScreen extends StatefulWidget {
  const SelfCareMyRoutineAddScreen({Key? key}) : super(key: key);

  @override
  State<SelfCareMyRoutineAddScreen> createState() =>
      _SelfCareMyRoutineAddScreenState();
}

class _SelfCareMyRoutineAddScreenState
    extends State<SelfCareMyRoutineAddScreen> {
  late TextEditingController titleController;
  late FocusNode titleNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    titleNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
        title: "루틴 추가",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                /// 제목 입력 text field
                SelfCareTextField(
                  title: "제목",
                  focusNode: titleNode,
                  controller: titleController,
                  inputAction: TextInputAction.done,
                  hintText: "제목을 입력해주세요.",
                ),
                const SizedBox(height: 32),

                /// item 리스트
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 32,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SelfCareMyRoutinePoseItemWidget(),

                        /// 마지막 item이라면 간격 x
                        SizedBox(height: index == 32 - 1 ? 0 : 40),
                      ],
                    );
                  },
                ),
                /// 디자인 보고 간격 넣었습니다.
                /// 안 넣으니깐 아이템이 밑에 씹히더라구용
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
                    title: "자세 추가",
                    imagePath: "assets/image/self_care_icon/add_icon.svg",
                    buttonColor: MaeumgagymColor.gray50,
                    textColor: MaeumgagymColor.gray800,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SelfCareMyRoutineButton(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    title: "완료",
                    buttonColor: MaeumgagymColor.blue500,
                    textColor: MaeumgagymColor.white,
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
