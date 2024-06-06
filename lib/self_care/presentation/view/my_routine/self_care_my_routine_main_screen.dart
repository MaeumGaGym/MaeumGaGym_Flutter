import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_add_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_title_container.dart';

class SelfCareMyRoutineMainScreen extends ConsumerStatefulWidget {
  const SelfCareMyRoutineMainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineMainScreen> createState() =>
      _SelfCareMyRoutineMainScreenState();
}

class _SelfCareMyRoutineMainScreenState
    extends ConsumerState<SelfCareMyRoutineMainScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => ref
          .read(selfCareMyRoutineMyRoutinesProvider.notifier)
          .getMyRoutineInit(),
    );
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
        child: RefreshIndicator(
          color: MaeumgagymColor.blue500,
          onRefresh: () async {
            ref
                .read(selfCareMyRoutineMyRoutinesProvider.notifier)
                .getMyRoutineInit();
          },
          child: SingleChildScrollView(
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
                  myRoutineState.statusCode.when(
                    data: (data) {
                      if (data == 200) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),

                          /// Notifier에 입력된 Model 개수만큼
                          itemCount: myRoutineState.routineList.length,
                          itemBuilder: (context, index) {
                            /// 공통된 변수
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: index ==
                                          myRoutineState.routineList.length -
                                              1
                                      ? 0
                                      : 12),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SelfCareMyRoutineDetailScreen(
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
                        );
                      } else if (data == 204) {
                        return const Text(
                          '루틴이 없습니다 ㅎㅎ',
                        );
                      } else {
                        return Text(
                          "${myRoutineState.statusCode}",
                        );
                      }
                    },
                    error: (error, stack) {
                      return Text('에러가 발생했습니다: $error');
                    },
                    loading: () {
                      return Center(
                          child: CircularProgressIndicator(
                        color: MaeumgagymColor.blue500,
                      ));
                    },
                  ),
                  const SizedBox(height: 98),
                ],
              ),
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
