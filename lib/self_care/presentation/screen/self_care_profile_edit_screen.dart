import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/edit/container/self_care_profile_edit_text_field_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/edit/widget/self_care_animated_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareProfileEditScreen extends ConsumerWidget {
  const SelfCareProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
        title: "내 정보 변경",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SelfCareProfileEditTextFieldContainer(),

              /// 키보드가 활성화 될 때 높이만큼 여백을 추가
              /// >> 마지막 TextField가 키보드에 가려지지 않고 스크롤 잘됨 ^^ 이거 ㄹㅇ 개 꿀팁 미쳤음..
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        /// 버튼 주변에 회색. 꼴받는 부분 색 변경
        /// >> 이렇게 해도 문제 없다네요 ~~
        color: MaeumgagymColor.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: ref.watch(selfCareTextFieldProvider.notifier).state ? 0 : 20,
            /// textfield가 활성화 되면 padding 0, 비활성화 상태라면 padding 20
          ),
          child: const SafeArea(
            child: SelfCareAnimatedButton(),
          ),
        ),
      ),
    );
  }
}
