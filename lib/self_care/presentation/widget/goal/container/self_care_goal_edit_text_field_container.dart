import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';

class SelfCareGoalEditTextFieldContainer extends ConsumerStatefulWidget {
  const SelfCareGoalEditTextFieldContainer({super.key});

  @override
  ConsumerState<SelfCareGoalEditTextFieldContainer> createState() =>
      _SelfCareGoalEditTextFieldContainerState();
}

class _SelfCareGoalEditTextFieldContainerState
    extends ConsumerState<SelfCareGoalEditTextFieldContainer> {
  /// 제목
  late TextEditingController _titleController;
  late FocusNode _titleNode;

  /// 시작 날짜
  late TextEditingController _startDateController;
  late FocusNode _startDateNode;

  /// 마감 날짜
  late TextEditingController _endDateController;
  late FocusNode _endDateNode;

  /// 내용
  late TextEditingController _contentController;
  late FocusNode _contentNode;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _titleNode = FocusNode()..addListener(focusCheck);
    _startDateController = TextEditingController();
    _startDateNode = FocusNode()..addListener(focusCheck);
    _endDateController = TextEditingController();
    _endDateNode = FocusNode()..addListener(focusCheck);
    _contentController = TextEditingController();
    _contentNode = FocusNode()..addListener(focusCheck);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleNode.dispose();
    _startDateController.dispose();
    _startDateNode.dispose();
    _endDateController.dispose();
    _endDateNode.dispose();
    _contentController.dispose();
    _contentNode.dispose();
    super.dispose();
  }

  void focusCheck() {
    /// 각각의 FocusNode들이 Focus 되었는지 확인하는 함수
    ref.read(selfCareTextFieldProvider.notifier).state = _titleNode.hasFocus ||
        _startDateNode.hasFocus ||
        _endDateNode.hasFocus ||
        _contentNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelfCareTextField(
          title: "제목",
          focusNode: _titleNode,
          controller: _titleController,
          inputAction: TextInputAction.next,
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          title: "시작 날짜",
          focusNode: _startDateNode,
          controller: _startDateController,
          inputAction: TextInputAction.next,
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          title: "마감 날짜",
          focusNode: _endDateNode,
          controller: _endDateController,
          inputAction: TextInputAction.next,
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          height: 200,
          title: "내용",
          focusNode: _contentNode,
          controller: _contentController,
          inputAction: TextInputAction.done,
          /// 자동 줄 바꿈
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
