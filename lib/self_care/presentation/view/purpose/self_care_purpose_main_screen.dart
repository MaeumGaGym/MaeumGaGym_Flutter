import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/purpose/purpose_base_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_all_purposes_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/purpose/self_care_purpose_add_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/purpose/self_care_purpose_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/widget/self_care_purpose_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_title_container.dart';

class SelfCarePurposeMainScreen extends ConsumerStatefulWidget {
  const SelfCarePurposeMainScreen({super.key});

  @override
  ConsumerState<SelfCarePurposeMainScreen> createState() => _SelfCarePurposeMainScreenState();
}

class _SelfCarePurposeMainScreenState extends ConsumerState<SelfCarePurposeMainScreen> {
  late ScrollController paginationController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
          () => ref
          .read(selfCarePurposeAllPurposesProvider.notifier)
          .getAllPurpose(index: 0),
    );
    paginationController = ScrollController()..addListener(() {
      if (paginationController.position.pixels == paginationController.position.maxScrollExtent) {
        ref.read(selfCarePurposeAllPurposesProvider.notifier).getAllPurpose(index: ref.watch(selfCarePurposeAllPurposesProvider).purposeList.length);
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    final purposeAllState = ref.watch(selfCarePurposeAllPurposesProvider);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: paginationController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SelfCareDefaultTitleContainer(
                  title: "목표",
                  subTitle: "나만의 목표를 세워보세요.",
                ),
                const SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: purposeAllState.purposeList.length, // 임의로 넣은 아이템 갯수
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SelfCarePurposeDetailScreen(),
                            ),
                          ),
                          child: SelfCarePurposeItemWidget(
                            title: purposeAllState.purposeList[index].title.toString(),
                            subTitle: purposeAllState.purposeList[index].startDate.toString(),
                          ),
                        ),
                        SizedBox(height: index == 30 - 1 ? 0 : 12),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 98),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SelfCarePurposeAddScreen(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SelfCareMyRoutineButton(
            width: MediaQuery.of(context).size.width,
            height: 58,
            imageWidth: 24,
            imageHeight: 24,
            imagePath: "assets/image/self_care_icon/add_icon.svg",
            imageColor: MaeumgagymColor.white,
            title: "목표 추가하기",
            textColor: MaeumgagymColor.white,
            buttonColor: MaeumgagymColor.blue500,
          ),
        ),
      ),
    );
  }
}
