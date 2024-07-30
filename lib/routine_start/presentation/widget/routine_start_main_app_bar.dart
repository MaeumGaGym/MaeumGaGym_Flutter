import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/provider/routine_start_page_view_provider.dart';

class RoutineStartMainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Duration time;
  final int routineLength;
  const RoutineStartMainAppBar({super.key, required this.routineLength, required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double appbarWidth = MediaQuery.of(context).size.width - 32;

    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          surfaceTintColor: MaeumgagymColor.white,
          backgroundColor: MaeumgagymColor.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: appbarWidth / 3,
                child: Row(
                   children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const ImageWidget(
                        width: 28,
                        image: Images.arrowLeft,
                      ),
                    ),
                     const SizedBox(width: 16),
                     // PtdTextWidget.labelLarge("00:01", MaeumgagymColor.black)
                     time.inHours > 0 ?
                     PtdTextWidget.labelLarge(
                         "${time.inHours.toString().padLeft(2, "0")}"
                             ":${(time.inMinutes - (time.inHours * 60)).toString().padLeft(2, "0")}"
                             ":${(time.inSeconds - (time.inMinutes * 60)).toString().padLeft(2, "0")}",
                         MaeumgagymColor.black) : PtdTextWidget.labelLarge(
                             "${(time.inMinutes - (time.inHours * 60)).toString().padLeft(2, "0")}"
                             ":${(time.inSeconds - (time.inMinutes * 60)).toString().padLeft(2, "0")}",
                         MaeumgagymColor.black),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: appbarWidth / 3,
                height: 10,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: routineLength,
                  itemBuilder: (context, index) {
                    if (index == ref.watch(routineStartPageViewProvider)) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Container(
                          width: 16,
                          height: 6,
                          decoration: BoxDecoration(
                            color: MaeumgagymColor.blue500,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Container(
                          width: 10,
                          height: 6,
                          decoration: BoxDecoration(
                            color: MaeumgagymColor.gray100,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(width: appbarWidth / 3, height: 1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
