import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';

class SelfCareProfileEditTextFieldContainer extends ConsumerStatefulWidget {
  const SelfCareProfileEditTextFieldContainer({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareProfileEditTextFieldContainer> createState() =>
      _SelfCareProfileEditTextFiledContainerState();
}

class _SelfCareProfileEditTextFiledContainerState
    extends ConsumerState<SelfCareProfileEditTextFieldContainer> {
  /// initState에서 초기화해주려고 late로 지정해줬습니다.
  /// 이름
  late TextEditingController _nameController;
  late FocusNode _nameNode;

  /// 키
  late TextEditingController _heightController;
  late FocusNode _heightNode;

  /// 몸무게
  late TextEditingController _weightController;
  late FocusNode _weightNode;

  /// 성별
  late TextEditingController _sexController;
  late FocusNode _sexNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    /// addListener >> 변경이 감지될 때마다 로직 실행
    _nameNode = FocusNode()..addListener(focusCheck);
    _heightController = TextEditingController();
    _heightNode = FocusNode()..addListener(focusCheck);
    _weightController = TextEditingController();
    _weightNode = FocusNode()..addListener(focusCheck);
    _sexController = TextEditingController();
    _sexNode = FocusNode()..addListener(focusCheck);
  }

  @override
  void dispose() {
    /// 안 쓸때에는 죽이기 !
    _nameController.dispose();
    _nameNode.dispose();
    _heightController.dispose();
    _heightNode.dispose();
    _weightController.dispose();
    _weightNode.dispose();
    _sexController.dispose();
    _sexNode.dispose();
    super.dispose();
  }

  void focusCheck() { /// 각각의 FocusNode들이 Focus 되었는지 확인하는 함수
    ref.read(selfCareTextFieldProvider.notifier).state = _nameNode.hasFocus ||
        _heightNode.hasFocus ||
        _weightNode.hasFocus ||
        _sexNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelfCareTextField(
          title: "이름",
          focusNode: _nameNode,
          controller: _nameController,
          inputAction: TextInputAction.next,
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          title: "키",
          focusNode: _heightNode,
          controller: _heightController,
          inputAction: TextInputAction.next,
          suffixText: "cm",
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          title: "몸무게",
          focusNode: _weightNode,
          controller: _weightController,
          inputAction: TextInputAction.next,
          suffixText: "kg",
        ),
        const SizedBox(height: 32),
        SelfCareTextField(
          title: "성별",
          focusNode: _sexNode,
          controller: _sexController,
          inputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
