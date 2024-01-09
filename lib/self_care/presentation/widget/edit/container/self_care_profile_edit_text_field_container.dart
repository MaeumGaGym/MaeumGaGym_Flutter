import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareProfileEditTextFiledContainer extends StatefulWidget {
  const SelfCareProfileEditTextFiledContainer({Key? key}) : super(key: key);

  @override
  State<SelfCareProfileEditTextFiledContainer> createState() => _SelfCareProfileEditTextFiledContainerState();
}

class _SelfCareProfileEditTextFiledContainerState extends State<SelfCareProfileEditTextFiledContainer> {
  late TextEditingController _nameController; /// 이름
  late TextEditingController _heightController; /// 키
  late TextEditingController _weightController; /// 몸무게
  late TextEditingController _sexController; /// 성별

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
        SizedBox(height: 8),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: BoxDecoration(
            color: MaeumgagymColor.gray25,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: _nameController,
            style: TextStyle(decorationThickness: 0),
          ),
        ),
      ],
    );
  }
}
