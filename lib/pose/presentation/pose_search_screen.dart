import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import 'package:maeum_ga_gym_flutter/pose/presentation/pose_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/pose/provider/pose_search_controller.dart';
import 'package:maeum_ga_gym_flutter/pose/widget/pose_data.dart';

class PoseSearchScreen extends ConsumerStatefulWidget {
  const PoseSearchScreen({super.key});

  @override
  ConsumerState<PoseSearchScreen> createState() => _PoseSearchScreenState();
}

class _PoseSearchScreenState extends ConsumerState<PoseSearchScreen> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textState = ref.watch(poseSearchController).text;
    var textNotifierState = ref.read(poseSearchController.notifier);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: MaeumgagymColor.gray50,
              borderRadius: BorderRadius.circular(8),
            ),
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
                  )),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 4),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
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
                          //color: Colors.white,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                                      PtdTextWidget.bodyMedium(
                                        data[index]['simpleName'],
                                        MaeumgagymColor.black,
                                      ),
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
