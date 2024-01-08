/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/pose/presentation/pose_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/pose/provider/pose_search_controller.dart';
import 'package:maeum_ga_gym_flutter/pose/widget/pose_data.dart';

class PoseSearchScreen extends ConsumerStatefulWidget {
  const PoseSearchScreen({super.key});

  @override
  ConsumerState<PoseSearchScreen> createState() => _PoseSearchScreenState();
}

class _PoseSearchScreenState extends ConsumerState<PoseSearchScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textState = ref.watch(poseSearchController).text;
    final textNotifierState = ref.read(poseSearchController.notifier);

    return Scaffold(
      appBar: PreferredSize(
        /// AppBar Size 지정
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,

          /// AppBar
          title: Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: MaeumgagymColor.gray50,
              borderRadius: BorderRadius.circular(8),
            ),

            /// TextField
            child: TextField(
              controller: textController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onChanged: (value) => textNotifierState.saveText(value),
              cursorWidth: 1,
              cursorHeight: 20,
              style: const TextStyle(height: 1.23),
              cursorColor: MaeumgagymColor.blue500,
              decoration: InputDecoration(
                hintText: '자세 검색',
                hintStyle: TextStyle(
                  fontFamily: pretendard,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: MaeumgagymColor.gray300,
                  height: 2.3,
                ),
                contentPadding: const EdgeInsets.only(top: 6),
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: SvgPicture.asset(
                    'assets/image/pose_icon/search.svg',
                    width: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 4),

              /// 검색된 List들
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    /// 만약 textField에 값에 이름이 들어가지 않는다면 SizedBox.shrink
                    if (textState.isNotEmpty &&
                        !(data[index]['simpleName'].contains(textState))) {
                      return const SizedBox.shrink();
                    } else {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PoseDetailScreen(
                                poseImages: data[index]['poseImages'],
                                simpleName: data[index]['simpleName'],
                                exactName: data[index]['exactName'],
                                simplePart: data[index]['simplePart'],
                                exactPart: data[index]['exactPart'],
                                exerciseWay: data[index]['exerciseWay'],
                                caution: data[index]['caution'],
                              ),
                            )),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          color: Colors.white,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /// Pose Image
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: MaeumgagymColor.gray50,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      data[index]['poseImages'][0],
                                    ),
                                  ),
                                ),
                              ),

                              /// Contents
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 122,
                                  height: 48,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// SimpleName
                                      PtdTextWidget.bodyMedium(
                                        data[index]['simpleName'],
                                        MaeumgagymColor.black,
                                      ),

                                      /// ExactPart
                                      PtdTextWidget.bodyMedium(
                                        data[index]['exactPart'],
                                        MaeumgagymColor.gray400,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
