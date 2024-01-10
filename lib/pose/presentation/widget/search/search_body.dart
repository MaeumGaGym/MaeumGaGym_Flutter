/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Screen
import '../../view/pose_detail_screen.dart';

class SearchBody extends StatelessWidget {
  final String textFieldState;
  final List<Map<String, dynamic>> data;
  final TextEditingController textEditingController;

  const SearchBody(
      {super.key,
      required this.textFieldState,
      required this.data,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                if (textFieldState.isNotEmpty &&
                    !(data[index]['simpleName']!.contains(textFieldState))) {
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
                      ),
                    ),
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
                              width: MediaQuery.of(context).size.width - 122,
                              height: 48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
