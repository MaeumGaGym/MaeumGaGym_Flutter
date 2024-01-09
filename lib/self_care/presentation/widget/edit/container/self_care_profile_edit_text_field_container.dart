import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareProfileEditTextFiledContainer extends ConsumerStatefulWidget {
  const SelfCareProfileEditTextFiledContainer({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareProfileEditTextFiledContainer> createState() =>
      _SelfCareProfileEditTextFiledContainerState();
}

class _SelfCareProfileEditTextFiledContainerState
    extends ConsumerState<SelfCareProfileEditTextFiledContainer> {
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
    _nameController = TextEditingController();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    _sexController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _sexController.dispose();
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
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: BoxDecoration(
            color: MaeumgagymColor.gray25,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: MaeumgagymColor.gray50
            )
          ),
          child: Center(
            child: TextFormField(
              controller: _nameController,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Pretendard",
                overflow: TextOverflow.visible,
                decorationThickness: 0,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
              cursorColor: MaeumgagymColor.blue600,
            ),
          ),
        ),
      ],
    );
  }
}
