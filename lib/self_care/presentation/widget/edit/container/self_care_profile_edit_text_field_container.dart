import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareProfileEditTextFieldContainer extends ConsumerStatefulWidget {
  const SelfCareProfileEditTextFieldContainer({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareProfileEditTextFieldContainer> createState() =>
      _SelfCareProfileEditTextFiledContainerState();
}

class _SelfCareProfileEditTextFiledContainerState
    extends ConsumerState<SelfCareProfileEditTextFieldContainer> {
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
    _nameNode = FocusNode();
    _heightController = TextEditingController();
    _heightNode = FocusNode();
    _weightController = TextEditingController();
    _weightNode = FocusNode();
    _sexController = TextEditingController();
    _sexNode = FocusNode();
  }

  @override
  void dispose() {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PtdTextWidget.bodyMedium(
          "이름",
          MaeumgagymColor.black,
        ),
        const SizedBox(height: 8),
        SelfCareTextField(nameNode: _nameNode, nameController: _nameController),
      ],
    );
  }
}