import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/widget/self_care_purpose_day_indicator.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';

class SelfCarePurposeTextFieldContainer extends ConsumerStatefulWidget {
  final TextEditingController titleController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final TextEditingController contentController;

  const SelfCarePurposeTextFieldContainer({
    super.key,
    required this.titleController,
    required this.startDateController,
    required this.endDateController,
    required this.contentController,
  });

  @override
  ConsumerState<SelfCarePurposeTextFieldContainer> createState() =>
      _SelfCareGoalEditTextFieldContainerState();
}

class _SelfCareGoalEditTextFieldContainerState
    extends ConsumerState<SelfCarePurposeTextFieldContainer> {
  /// 제목
  late FocusNode _titleNode;

  /// 시작 날짜
  late FocusNode _startDateNode;

  /// 마감 날짜
  late FocusNode _endDateNode;

  /// 내용
  late FocusNode _contentNode;

  @override
  void initState() {
    super.initState();
    _titleNode = FocusNode()..addListener(focusCheck);
    _startDateNode = FocusNode()..addListener(focusCheck);
    _endDateNode = FocusNode()..addListener(focusCheck);
    _contentNode = FocusNode()..addListener(focusCheck);
  }

  @override
  void dispose() {
    _titleNode.dispose();
    _startDateNode.dispose();
    _endDateNode.dispose();
    _contentNode.dispose();
    super.dispose();
  }

  void focusCheck() {
    /// 각각의 FocusNode들이 Focus 되었는지 확인하는 함수
    ref.read(selfCareTextFieldProvider.notifier).state = _titleNode.hasFocus ||
        _contentNode.hasFocus;
  }

  void focusOut() {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelfCareTextField(
          title: "제목",
          focusNode: _titleNode,
          controller: widget.titleController,
          inputAction: TextInputAction.next,
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          title: "시작 날짜",
          focusNode: _startDateNode,
          controller: widget.startDateController,
          inputAction: TextInputAction.next,
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          title: "마감 날짜",
          focusNode: _endDateNode,
          controller: widget.endDateController,
          inputAction: TextInputAction.next,
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          height: 200,
          title: "내용",
          focusNode: _contentNode,
          controller: widget.contentController,
          inputAction: TextInputAction.done,
          /// 자동 줄 바꿈
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
