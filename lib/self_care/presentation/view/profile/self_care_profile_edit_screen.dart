import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeungagym_text_style.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/profile/self_care_profile_edit_profile_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/profile/self_care_profile_sex_select_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/profile/self_care_profile_main_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/self_care_profile_sex_select_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_animated_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';

class SelfCareProfileEditScreen extends ConsumerStatefulWidget {
  const SelfCareProfileEditScreen({super.key});

  @override
  ConsumerState<SelfCareProfileEditScreen> createState() =>
      _SelfCareProfileEditScreenState();
}

class _SelfCareProfileEditScreenState
    extends ConsumerState<SelfCareProfileEditScreen> {
  Map<String, String> sex = {
    "남성": "MAN",
    "여성": "WOMAN",
  };

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  /// 이름
  late TextEditingController _nameController;
  late FocusNode _nameNode;

  /// 키
  late TextEditingController _heightController;
  late FocusNode _heightNode;

  /// 몸무게
  late TextEditingController _weightController;
  late FocusNode _weightNode;

  void _createOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _customDropdown();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  // 드롭다운 해제.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

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
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    _nameController.dispose();
    _nameNode.dispose();
    _heightController.dispose();
    _heightNode.dispose();
    _weightController.dispose();
    _weightNode.dispose();
    super.dispose();
  }

  void focusCheck() {
    /// 각각의 FocusNode들이 Focus 되었는지 확인하는 함수
    ref.read(selfCareTextFieldProvider.notifier).state =
        _nameNode.hasFocus || _heightNode.hasFocus || _weightNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    final dropDownNotifier = ref.read(dropDownCheckProvider.notifier);
    final editUserProfileNotifier =
        ref.read(selfCareProfileEditProfileProvider.notifier);
    final sexSelectorState = ref.watch(sexSelectProvider);
    ref.listen(selfCareProfileEditProfileProvider.select((value) => value),
        (previous, next) {
      if (next == const AsyncData<int?>(204)) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        ref.read(routineMyRoutinesProvider.notifier).getMyRoutineInit();
      }
    });
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _removeOverlay();
        dropDownNotifier.state = false;
      },
      child: Scaffold(
        backgroundColor: MaeumgagymColor.white,
        appBar: const SelfCareDefaultAppBar(
          iconPath: "assets/image/core_icon/left_arrow_icon.svg",
          title: "내 정보 변경",
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelfCareTextField(
                    title: "이름",
                    focusNode: _nameNode,
                    controller: _nameController,
                    inputAction: TextInputAction.next,
                    hintText: "이름",
                  ),
                  const SizedBox(height: 32),
                  SelfCareTextField(
                    title: "키",
                    focusNode: _heightNode,
                    controller: _heightController,
                    inputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    suffixText: "cm",
                    hintText: "키",
                  ),
                  const SizedBox(height: 32),
                  SelfCareTextField(
                    title: "몸무게",
                    focusNode: _weightNode,
                    controller: _weightController,
                    inputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    suffixText: "kg",
                    hintText: "몸무게",
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      if (_overlayEntry != null) {
                        _removeOverlay();
                        dropDownNotifier.state = false;
                      } else {
                        _createOverlay();
                        dropDownNotifier.state = true;
                      }
                    },
                    child: CompositedTransformTarget(
                      link: _layerLink,
                      child: const SelfCareProfileSexSelectWidget(),
                    ),
                  ),

                  /// 키보드가 활성화 될 때 높이만큼 여백을 추가
                  /// >> 마지막 TextField가 키보드에 가려지지 않고 스크롤 잘됨 ^^ 이거 ㄹㅇ 개 꿀팁 미쳤음..
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          color: MaeumgagymColor.white,
          child: Padding(
            padding: EdgeInsets.only(
              bottom:
                  ref.watch(selfCareTextFieldProvider.notifier).state ? 0 : 20,

              /// textfield가 활성화 되면 padding 0, 비활성화 상태라면 padding 20
            ),
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  if (!_nameController.text.contains(" ") &&
                      _nameController.text.isNotEmpty &&
                      _heightController.text.isNotEmpty &&
                      _weightController.text.isNotEmpty) {
                    editUserProfileNotifier.editUserProfile(
                      nickname: _nameController.text,
                      weight: double.tryParse(_weightController.text)!,
                      height: double.tryParse(_heightController.text)!,
                      gender: sex.containsKey(sexSelectorState)
                          ? sex[sexSelectorState].toString()
                          : "NONE",
                    );
                  }
                },
                child: const SelfCareAnimatedButton(
                  buttonTitle: "수정 완료",
                  buttonAnimatedTitle: "확인",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _customDropdown() {
    final sexSelectNotifier = ref.read(sexSelectProvider.notifier);
    final dropDownNotifier = ref.read(dropDownCheckProvider.notifier);
    return OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width - 40,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, 88),
          child: Material(
            color: MaeumgagymColor.gray25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: MaeumgagymColor.gray50,
                ),
              ),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: sex.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        sexSelectNotifier.state = sex.keys.elementAt(index);
                        _removeOverlay();
                        dropDownNotifier.state = false;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          sex.keys.elementAt(index),
                          style: MaeumGaGymTextStyle.bodyLarge(
                            MaeumgagymColor.black,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.gray50,
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
