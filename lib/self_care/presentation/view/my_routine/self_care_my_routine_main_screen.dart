import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_add_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_title_widget.dart';

class SelfCareMyRoutineMainScreen extends ConsumerStatefulWidget {
  const SelfCareMyRoutineMainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineMainScreen> createState() =>
      _SelfCareMyRoutineMainScreenState();
}

class _SelfCareMyRoutineMainScreenState
    extends ConsumerState<SelfCareMyRoutineMainScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(listener);
    Future.delayed(
      Duration.zero,
      () => ref
          .read(selfCareMyRoutineMyRoutinesProvider.notifier)
          .getMyRoutineInit(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void listener() {
    final myRoutineState = ref.watch(selfCareMyRoutineMyRoutinesProvider);

    /// ~/ => 나눈 몫을 정수형으로 반환
    int pageIndex = myRoutineState.routineList.length ~/ 10;
    bool hasMore = myRoutineState.routineList.length % 10 != 0 ? false : true;

    /// 화면 스크롤 컨트롤러의 위치가 최대 스크롤 위치이면서 API가 로딩 중이 아닐 때 (API가 실행 중이 아닐 때)
    /// => 중복 요청 방지
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !myRoutineState.statusCode.isLoading) {
      /// 리스트의 데이터 갯수를 10으로 나눈 나머지가 0이 아닐 때, 즉 데이터가 10으로 나눠떨어지지 않을 때 계속해서 값이 호출되고, 리스트에 추가되는 경우를 방지
      if (hasMore) {
        ref
            .read(selfCareMyRoutineMyRoutinesProvider.notifier)
            .getMyRoutine(index: pageIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final myRoutineState = ref.watch(selfCareMyRoutineMyRoutinesProvider);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SelfCareDefaultTitleContainer(
                  title: "내 루틴",
                  subTitle: "나만의 루틴을 구성하여\n규칙적인 운동을 해보세요.",
                ),
                const SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  /// Notifier에 입력된 Model 개수만큼
                  itemCount: myRoutineState.routineList.length,
                  itemBuilder: (context, index) {
                    /// 공통된 변수
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index == myRoutineState.routineList.length - 1
                              ? 0
                              : 12),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelfCareMyRoutineDetailScreen(
                              listIndex: index,
                            ),
                          ),
                        ),
                        child: SelfCareMyRoutineItemWidget(
                          listIndex: index,
                        ),
                      ),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SelfCareMyRoutineAddScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SelfCareMyRoutineButton(
            width: MediaQuery.of(context).size.width,
            height: 58,
            imageWidth: 24,
            imageHeight: 24,
            imagePath: "assets/image/self_care_icon/add_icon.svg",
            imageColor: MaeumgagymColor.white,
            title: "루틴 추가하기",
            textColor: MaeumgagymColor.white,
            buttonColor: MaeumgagymColor.blue500,
          ),
        ),
      ),
    );
  }
}
