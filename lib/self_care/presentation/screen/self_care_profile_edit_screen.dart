import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/edit/container/self_care_profile_edit_text_field_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/edit/widget/self_care_animated_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareProfileEditScreen extends StatelessWidget {
  const SelfCareProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
        title: "내 정보 변경",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelfCareProfileEditTextFieldContainer(),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: MaeumgagymColor.white,
        child: SafeArea(
          child: SelfCareAnimatedButton(),
        ),
      ),
    );
  }
}
