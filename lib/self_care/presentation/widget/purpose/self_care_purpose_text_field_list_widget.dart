import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_calender_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/self_care_purpose_date_field.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';

class SelfCarePurposeTextFieldListWidget extends ConsumerStatefulWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  const SelfCarePurposeTextFieldListWidget({
    super.key,
    required this.titleController,
    required this.contentController,
  });

  @override
  ConsumerState<SelfCarePurposeTextFieldListWidget> createState() =>
      _SelfCareGoalEditTextFieldContainerState();
}

class _SelfCareGoalEditTextFieldContainerState
    extends ConsumerState<SelfCarePurposeTextFieldListWidget> {
  /// 제목
  late FocusNode _titleNode;

  /// 내용
  late FocusNode _contentNode;

  @override
  void initState() {
    super.initState();
    _titleNode = FocusNode()..addListener(focusCheck);
    _contentNode = FocusNode()..addListener(focusCheck);
  }

  @override
  void dispose() {
    _titleNode.dispose();
    _contentNode.dispose();
    super.dispose();
  }

  void focusCheck() {
    /// 각각의 FocusNode들이 Focus 되었는지 확인하는 함수
    ref.read(selfCareTextFieldProvider.notifier).state =
        _titleNode.hasFocus || _contentNode.hasFocus;

    if (ref.read(selfCarePurposeStartCalenderProvider).isActive) {
      ref.read(selfCarePurposeStartCalenderProvider.notifier).overlayRemove();
    }

    if (ref.read(selfCarePurposeEndCalenderProvider).isActive) {
      ref.read(selfCarePurposeEndCalenderProvider.notifier).overlayRemove();
    }
  }

  void focusOut() {}

  void showStartDateCalender() {
    final selfCarePurposeStartNotifier =
        ref.read(selfCarePurposeStartCalenderProvider.notifier);

    if (ref.read(selfCarePurposeEndCalenderProvider).isActive) {
      ref.read(selfCarePurposeEndCalenderProvider.notifier).overlayRemove();
    }

    if (!ref.read(selfCarePurposeStartCalenderProvider).isActive) {
      selfCarePurposeStartNotifier.overlayCalenderInset(
        context: context,
        notifier: selfCarePurposeStartNotifier,
      );
      setState(() {});
    } else {
      selfCarePurposeStartNotifier.overlayRemove();
      setState(() {});
    }
  }

  void showEndDateCalender() {
    final selfCarePurposeEndNotifier =
        ref.read(selfCarePurposeEndCalenderProvider.notifier);

    if (ref.read(selfCarePurposeStartCalenderProvider).isActive) {
      ref.read(selfCarePurposeStartCalenderProvider.notifier).overlayRemove();
    }

    if (!ref.read(selfCarePurposeEndCalenderProvider).isActive) {
      selfCarePurposeEndNotifier.overlayCalenderInset(
        context: context,
        notifier: selfCarePurposeEndNotifier,
      );
      setState(() {});
    } else {
      selfCarePurposeEndNotifier.overlayRemove();
      setState(() {});
    }
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
        GestureDetector(
          onTap: () => showStartDateCalender(),
          child: SelfCarePurposeDateField(
            title: "시작 날짜",
            calenderState: ref.watch(selfCarePurposeStartCalenderProvider),
          ),
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: () => showEndDateCalender(),
          child: SelfCarePurposeDateField(
            title: "마감 날짜",
            calenderState: ref.watch(selfCarePurposeEndCalenderProvider),
          ),
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
