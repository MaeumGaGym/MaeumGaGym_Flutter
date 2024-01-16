import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
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
      appBar: SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
        title: "루틴 추가",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              SelfCareTextField(
                title: "제목",
                focusNode: titleNode,
                controller: titleController,
                inputAction: TextInputAction.done,
                hintText: "제목을 입력해주세요.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
