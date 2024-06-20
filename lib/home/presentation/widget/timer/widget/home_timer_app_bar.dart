import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_timer_add_duration_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/widget/home_timer_time_picker_widget.dart';

class HomeTimerAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeTimerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showAddTimerScreen() {
      showModalBottomSheet(
        context: context,
        // 투명색
        useSafeArea: true,
        isDismissible: true,
        backgroundColor: MaeumgagymColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (context) {
          final homeAddTimerNotifier =
              ref.read(homeTimerAddDurationProvider.notifier);

          homeAddTimerNotifier.hourNotifier(0);
          homeAddTimerNotifier.minuteNotifier(0);
          homeAddTimerNotifier.secondsNotifier(0);

          return const HomeTimerTimePickerWidget();
        },
      );
    }

    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const ImageWidget(
                  image: Images.arrowLeft,
                  width: 32,
                  height: 32,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => showAddTimerScreen(),
                    child: const ImageWidget(
                      image: Images.editAdd,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const ImageWidget(
                    image: Images.iconsDotsVertical,
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
